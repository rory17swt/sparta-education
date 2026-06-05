import boto3

s3_client = boto3.client('s3')


# s3_client.create_bucket(
#     Bucket='rory-test-sparta-de-2026',
#     CreateBucketConfiguration={
#         'LocationConstraint': 'eu-west-1'
#     }
# )

# s3_client.upload_file(
#     'test.csv',  # local file path
#     'data-eng-resources',   # bucket name
#     'se-data-folder/test.csv'    # key (name in S3)
# )

# s3_client.delete_object(
#     Bucket='data-eng-resources',
#     Key='se-data-folder/test.csv'
# )

# s3_client.delete_bucket(
#     Bucket='rory-test-sparta-de-2026'
# )