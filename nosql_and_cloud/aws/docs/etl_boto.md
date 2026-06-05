## Bonus: Basic ETL with Boto3 and Pandas

### What is Pandas

Pandas is a Python library for working with structured data (think tables/spreadsheets). It's the most commonly used data manipulation tool in data engineering and data science. It lets you load, clean, transform, and analyse data with minimal code.

The core data structure is a **DataFrame** (`df`) - essentially a table with rows and columns, similar to a spreadsheet or a SQL table.

### The ETL Script

```python
import boto3
import pandas as pd

s3_client = boto3.client('s3')

# --- EXTRACT ---

# List objects in the python/ folder of the bucket (used to find the file)
# bucket_contents = s3_client.list_objects_v2(
#     Bucket='data-eng-resources',
#     Prefix='python/'
# )
# for object in bucket_contents['Contents']:
#     print(object['Key'])

# Download the raw fish market data from S3 to local machine
# s3_client.download_file(
#     'data-eng-resources',      # bucket
#     'python/fish-market.csv',  # key in S3
#     'fish-market.csv'          # local filename to save as
# )

# Load the CSV into a pandas DataFrame
df = pd.read_csv('fish-market.csv')
# print(df.head())  # preview first 5 rows

# --- TRANSFORM ---

# Group by Species and calculate the average of all numeric columns
df_fish_agg = df.groupby('Species').mean()
# print(df_agg)  # preview the aggregated data

# Save the transformed data to a local CSV
ddf_fish_agg.to_csv('fish-market-agg.csv')

# --- LOAD ---

# Upload the transformed CSV back to S3
s3_client.upload_file(
    'fish-market-agg.csv',                          # local file
    'data-eng-resources',                           # bucket
    'se-data-folder/fish/rory/fish-market-agg.csv'  # key in S3
)
```

### Key Pandas Methods Used

| Method | Description |
|---|---|
| `pd.read_csv()` | Loads a CSV file into a DataFrame |
| `df.head()` | Previews the first 5 rows |
| `df.groupby('col')` | Groups rows by a column's values — like SQL `GROUP BY` |
| `.mean()` | Calculates the average of each numeric column per group |
| `df.to_csv()` | Saves a DataFrame back to a CSV file |