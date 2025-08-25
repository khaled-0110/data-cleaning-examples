import pandas as pd

# Example dataset
data = {
    "id": list(range(1, 21)),
    "amount": [
        100, 102, 98, 105, 110, 108, 95, 99, 101, 103,   # normal values
        97, 104, 106, 107, 109, 111, 96, 112, 98, 5000   # <-- outlier at the end
    ]
}

df = pd.DataFrame(data)

print("Original dataset:")
print(df)

mean_val = df["amount"].mean()
std_val = df["amount"].std()

upper_limit = mean_val + 3 * std_val
lower_limit = mean_val - 3 * std_val

df["amount"] = df["amount"].apply(
    lambda x: mean_val if (x > upper_limit or x < lower_limit) else x
)

print("\nCleaned dataset (outliers replaced with mean):")
print(df)
