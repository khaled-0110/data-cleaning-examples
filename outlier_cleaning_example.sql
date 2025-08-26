CREATE TABLE Amounts (
    id INT,
    amount INT
);

INSERT INTO Amounts (id, amount) VALUES
(1, 100), (2, 102), (3, 98), (4, 105), (5, 110),
(6, 108), (7, 95), (8, 99), (9, 101), (10, 103),
(11, 97), (12, 104), (13, 106), (14, 107), (15, 109),
(16, 111), (17, 96), (18, 112), (19, 98), (20, 5000); -- outlier

WITH stats AS (
    SELECT 
        AVG(CAST(amount AS FLOAT)) AS mean_val,
        STDEV(CAST(amount AS FLOAT)) AS std_val
    FROM Amounts
),
limits AS (
    SELECT 
        mean_val,
        std_val,
        mean_val + 3 * std_val AS upper_limit,
        mean_val - 3 * std_val AS lower_limit
    FROM stats
)
SELECT 
    a.id,
    CASE 
        WHEN a.amount > l.upper_limit OR a.amount < l.lower_limit 
        THEN l.mean_val  -- replace outlier with mean
        ELSE a.amount
    END AS cleaned_amount
FROM Amounts a
CROSS JOIN limits l;
