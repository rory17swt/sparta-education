## boto3: client vs resource

boto3 gives you two ways to interact with AWS services:

### client
- Low-level interface that maps directly to AWS API calls
- Returns raw Python dictionaries
- More hands-on but gives you full control

```python
s3_client = boto3.client('s3')
response = s3_client.list_buckets()
# response is a dict — you have to dig into it yourself
# e.g. response['Buckets']
```

### resource
- High-level, object-oriented interface
- Returns Python objects with attributes and methods
- Less hands-on, feels more "Pythonic"

```python
s3_resource = boto3.resource('s3')
bucket = s3_resource.Bucket('my-bucket')
# bucket is an object — you can call methods directly on it
# e.g. bucket.objects.all()
```

## Which to use?
- `client` when you need full control or the resource interface doesn't support what you need
- `resource` when you want cleaner, more readable code for common operations

## Keep Your Keys Safe

Never commit your AWS credentials to Git. Add your `.aws` folder to `.gitignore`:

`.aws/`

If you accidentally expose a key, deactivate it immediately in the AWS console under **IAM > Security credentials**.