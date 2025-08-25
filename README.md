# Data Cleaning Example: Outlier Adjustment

This project demonstrates how to:
- Load a dataset into Pandas
- Calculate averages
- Detect outliers (3 standard deviation rule)
- Replace outliers with the mean value

## Example Run

Original dataset:

id amount

1 100

2 105

3 98

4 5000 <- outlier

5 110

6 102

7 97


Cleaned dataset:

id amount

1 100

2 105

3 98

4 102.57 <- outlier replaced with mean

5 110

6 102

7 97

