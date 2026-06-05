import boto3
import pandas as pd

s3_client = boto3.client('s3')

# bucket_contents = s3_client.list_objects_v2(
#     Bucket='data-eng-resources',
#     Prefix='python/'
# )

# for object in bucket_contents['Contents']:
#     print(object['Key'])

# s3_client.download_file(
#     'data-eng-resources',      # bucket
#     'python/fish-market.csv',  # key in S3
#     'fish-market.csv'          # local filename to save as
# )

df = pd.read_csv('fish-market.csv')
# print(df.head())

df_fish_agg = df.groupby('Species').mean()
# print(df_agg)

df_fish_agg.to_csv('fish-market-agg.csv')

s3_client.upload_file(
    'fish-market-agg.csv',
    'data-eng-resources',
    'se-data-folder/fish/rory/fish-market-agg.csv'
)