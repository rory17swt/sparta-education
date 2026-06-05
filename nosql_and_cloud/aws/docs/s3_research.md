# AWS S3 (Simple Storage Service) - Research Notes

## What is S3

S3 stands for **Simple Storage Service**. It is AWS's cloud storage solution, it's essentially renting storage space in the cloud.

### Key Properties

- **Secure**: Access controls and encryption built in
- **Durable**: AWS claims **99.9999999% durability** (11 nines) through multiple backups across data centres
- **Scalable**: Storage scales automatically, no need to provision capacity upfront

## How S3 Stores Data

S3 stores data as **objects**, not files in a traditional file system.

| Term | Description |
|---|---|
| **Object** | The data itself plus its metadata (e.g. file size, content type, last modified) |
| **Bucket** | The container that holds objects - like a top-level folder |

### Bucket Rules
- Bucket names must be **globally unique** across all of AWS
- All objects live inside a bucket

### Analogy
Think of it like throwing clothes on a bed:
- **Clothes** = the data
- **Bed** = the cloud / data lake

## S3 Storage Classes

S3 offers different storage classes depending on how frequently you need to access the data and how much you want to pay.

| Storage Class | Use Case | Key Characteristics |
|---|---|---|
| **S3 Express One Zone** | Highest performance, most frequently accessed data | Single-digit millisecond latency, 10x faster than Standard, up to 80% lower request costs, stored in a single Availability Zone |
| **S3 Standard** | General purpose, frequently accessed data | Low latency, high throughput, highest storage cost, no retrieval fee |
| **S3 Intelligent-Tiering** | Data with unknown or changing access patterns | Automatically moves data between tiers to optimise cost, small monthly monitoring fee, 128KB minimum object size |
| **S3 Standard-IA** (Infrequent Access) | Data accessed infrequently but needs fast retrieval | Lower storage cost than Standard, retrieval fee applies, minimum 30 day storage charge |
| **S3 One Zone-IA** | Infrequently accessed, non-critical or re-creatable data | 20% cheaper than Standard-IA, stored in a single AZ — less resilient, retrieval fee applies |
| **S3 Glacier Instant Retrieval** | Archive data needing occasional instant access | Millisecond retrieval, up to 68% cheaper than Standard-IA, minimum 90 day storage charge |
| **S3 Glacier Flexible Retrieval** | Rarely accessed archive data, backup and disaster recovery | Retrieval in minutes to hours, free bulk retrieval option, minimum 90 day storage charge |
| **S3 Glacier Deep Archive** | Long-term archive, almost never accessed | Lowest cost of all classes, retrieval within 12 hours, minimum 180 day storage charge |

The less frequently you access the data, the cheaper the storage, but the longer (and more expensive) it is to retrieve.

## Pricing

- **Data in**: (uploading to S3) - free
- **Data out**: (downloading from S3) - charged per GB
- **Requests**: charged per number of requests (GET, PUT etc.)
- **Storage**: charged per GB stored per month

> AWS makes it cheap to get data in, but charges for data leaving their infrastructure. This is a common pattern across AWS services.

## What is an endpoint

An endpoint is a URL that points to a specific resource, it's the address you send a request to in order to access something. In AWS, endpoints are the URLs used to interact with services.

## Why is S3 good for creating endpoints

Every object you upload to S3 automatically gets a publicly accessible URL in this format:

```
https://<bucket-name>.s3.<region>.amazonaws.com/<object-key>
```

This means you can upload an image once and immediately reference it anywhere in a `<img src="">` tag, an API response and a mobile app with no server required. No Express route (Node.js web framework), no file-serving logic, just a URL that works. That's why S3 is commonly used to host static assets like images, videos, and downloadable files.