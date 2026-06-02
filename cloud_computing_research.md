# Cloud Computing Research

## What is Cloud Computing

Cloud computing is the on-demand delivery of computing resources:
- Servers
- Storage
- Databases
- Networking
- Software
- Analytics

All over the internet with pay-as-you-go pricing

Rather than owning and maintaining physical hardware, organisations access these resources emotely via a provider's data centres. You pay only for what you use, scaling up or down as needed.

### What Makes Somthing "Cloud"

- **On-demand-self-service**: Resources can be provisioned without human interaction from the provider
- **Broad network access**: Available over the internet from any device
- **Resource pooling**: Provider infrastructure is shared across multiple customers (multi-tenancy)
- **Rapid elasticity**: Capacity can scale up or down near-instantly in response to demand
- **Measured service**: Usage is tracked and billed like a utility (compute hours, GB stored, API calls, etc.)

## What are Data Centres

A data centre is a physical facility that houses the computing infrastructure for cloud services. It can have thousands of servers, networking equipment and cooling systems. It's all enginerred for reliability, security and scale.

### What's Inside a Data Centre

| Component | Purpose |
|---|---|
| **Servers** | Compute workloads — running applications and processing data |
| **Storage arrays** | Persisting data at scale (SSDs, HDDs, NVMe) |
| **Network switches & routers** | Moving data between servers and to/from the internet |
| **Cooling systems** | Preventing hardware from overheating (air/liquid cooling) |
| **Redundant power (UPS/generators)** | Ensuring uptime even during power failures |
| **Physical security** | Biometric access, CCTV, security personnel || Component | Purpose |
|
| **Servers** | Compute workloads — running applications and processing data |
| **Storage arrays** | Persisting data at scale (SSDs, HDDs, NVMe) |
| **Network switches & routers** | Moving data between servers and to/from the internet |
| **Cooling systems** | Preventing hardware from overheating (air/liquid cooling) |
| **Redundant power (UPS/generators)** | Ensuring uptime even during power failures |
| **Physical security** | Biometric access, CCTV, security personnel |

### 📺 Video: Real-World Data Centre Walkthrough

[What's Really Inside a Real Data Center? — BigScoots Chicago](https://www.youtube.com/watch?v=84VQq6Pp33Q)

An inside look at a real commercial data centre in Chicago. Covers physical layout, cooling, cabling, power redundancy, and security.

## How Do You Know if Something is Running in the Cloud

There's no single way to tell if something if runnig in the cloud, but there are some clear signs to look out for:

- The service is accessed over the internet via a URL or API. No local installation required
- The doamin
    - *.amazonaws.com*
    - *.azurewebsites.net*
    - *.cloud.google.com
- Your billed based on usage rather than buying hardware
    - Compute hours
    - storage
    - API calls
- It scales automatically in response to load. This not possible with fixed on-premises hardware 

### Real-World Examples

- Gmail, Google Docs - running on Google Cloud
- Netflix - primarily built on AWS (also uses Google Cloud for some workloads)
- LinkedIn - runs on Azure
- Spotify - uses Google Cloud for data processing

## What are the Main 2 "Cloud Deployment" Models

Cloud deployment models define where infrastructure runs, who owns it, and who can access it.

### Public Cloud

Infrastructure is owned and operated by a third-party provider and delivered over the internet:

- AWS
- Azure
- Google Cloud

Resources are shared across multiple customers on the same physical hardware, though logically isolated.

### Private Cloud

Infrastructure dedicated exclusively to a single organisation. It may be hosted on-premises or by a third-party, but it is not shared with other customers.

- **Best for:** Organisations with strict regulatory requirements
    - Finance
    - Defence
    - Healthcare

- **Pros:** Maximum control, enhanced security, full customisation
- **Cons:** Expensive to build and maintain and limited elasticity compared to public cloud

## What are the 2 More Complex "Cloud Deployment" Models

### Hybrid Cloud

A hybrid cloud combines public and private cloud environments, connected by technology that allows workloads and data to move between them. Organisations can keep sensitive data on a private cloud while leveraging the scalability of the public cloud for less sensitive tasks.

**Example**:

A retail bank stores customer financial records in a private cloud for compliance, but uses AWS to run its customer-facing mobile app and handle peak demand.

### Multi-Cloud

A multi-cloud strategy uses services from two or more different cloud providers simultaneously. For example, using AWS for compute, Google Cloud for machine learning, and Azure for enterprise integrations.

This is distinct from hybrid cloud, which mixes public and private. Multi-cloud mixes multiple public providers.

- **Why use it**: Avoids being tied to one provider, lets you pick the best service for each job, and improves reliability
- **Cons:** Added operational complexity, it requires strong governance and cost management

## What are Three Main Types of "Cloud Services"

Cloud services are typically categorised into three delivery models. The further down the stack you go, the more the provider manages for you.

### IaaS - Infrastructure as a Service

You rent raw computing infrastructure: virtual machines, storage, and networking. You manage the OS, middleware and applications. This is the closest cloud equivalent to owning your own servers.

- **Examples:** AWS EC2, Azure Virtual Machines, Google Compute Engine
- **Best for:** Teams that need full control over their stack

### PaaS - Platform as a Service

The provider manages the underlying infrastructure and OS. You focus on building and deploying applications. It's like renting a fully equipped kitchen, you bring the recipe, not the equipment.

- **Examples:** Heroku, Google App Engine, Azure App Service
- **Best for:** Developers who want to focus on code, not infrastructure

### SaaS - Software as a Service

The provider delivers a fully managed software application over the internet. No installation, no maintenance. This is the cloud model most people interact with daily.

- **Examples:** Gmail, Salesforce, Slack, Microsoft 365, Zoom, Dropbox
- **Best for:** End users and businesses that want ready-to-use software without managing anything

## Advantages of Cloud Computing for a Business

### Cost Efficiency

Traditional IT requires large upfront costs like buying servers, networking equipment, and data centre space. Cloud converts this into a monthly bill based on actual usage. No upfront hardware investment and no cost for wasted resources.

### Scalability

Resources can be scaled up or down, or automatically in response to demand. A retailer can handle spikes without maintaining peak-capacity hardware all year.

### Global Reach

Cloud providers operate data centres across every major region. Businesses can deploy applications globally very quickly, this would previously require years of investment.

## Potential Disadvantages or Pitfalls for a Business

### Internet Dependency

Cloud services are entirely reliant on internet connectivity. Network outages or high latency can halt operations.

### Security and Data Privacy

Storing data on third-party infrastructure can introduce risks. Poorly set up permissions or a breach on the provider's side can expose sensitive data. Responsibility is shared between the provider and the customer.

### Vendor Lock-In

Deeply integrating with one provider's services makes it difficult and costly to migrate to another provider later. This is one of the main reasons businesses adopt a multi-cloud strategy.

### Unpredictable Costs

Pay-as-you-go billing is an advantage until it isn't. Without careful management, cloud costs can increase quickly. Forgotten services running in the cloud, paying for more stroage than you need, or unexpected data transfer fees can result in surprisingly large bills. This is very common.

### Compliance and Regulatory Risk

Regulated industries like finance, healthcare, and the public sector face complex requirements about where data is stored and who can access it. GDPR, for example, restricts transferring EU citizen data outside the EU. Navigating these constraints in the cloud requires careful planning.

### Downtime Risk

Even major providers experience outages. AWS, Azure, and Google Cloud have all had high-profile outages affecting thousands of businesses simultaneously. To protect against this, you need to deliberately design your system to run across multiple locations, which takes extra time and money.

## What are the "Big 3" Cloud Providers Known For

### 🟠 Amazon Web Services (AWS)

Launched in 2006, the original cloud provider and still the market leader. AWS is known for its vast amount of services and global infrastructure.

| USP | Detail |
|---|---|
| **Broadest service catalogue** | Over 200 cloud services |
| **Largest global footprint** | 33 regions, 105+ availability zones worldwide |
| **Mature ecosystem** | Largest community, documentation, and third-party tooling |
| **Key data services** | Redshift, S3, Glue, Athena, Kinesis |

### 🔵 Microsoft Azure

Launched in 2010, the enterprise favourite, particularly for Microsoft-centric organisations. Azure's core advantage is its deep integration with the Microsoft ecosystem.

| USP | Detail |
|---|---|
| **Microsoft ecosystem integration** | Seamless with Office 365, Active Directory, Teams, SQL Server |
| **Hybrid cloud leadership** | Best in class for bridging on-premises and cloud |
| **Enterprise focus** | Used by 85% of Fortune 500 companies |
| **Most geographic regions** | Highest number of data centre regions globally |
| **Key data services** | Azure Synapse Analytics, Data Factory, Data Lake Storage, Fabric |

### 🔴 Google Cloud Platform (GCP)

Launched in 2008, built on the same infrastructure that powers Google Search, YouTube, and Gmail.

| USP | Detail |
|---|---|
| **Data & analytics leadership** | BigQuery is widely considered the best managed data warehouse |
| **AI/ML capabilities** | Vertex AI and TPUs for large-scale AI training |
| **Network performance** | Google's private global fibre network offers superior latency |
| **Competitive pricing** | Per-second billing; discounts applied automatically |
| **Key data services** | BigQuery, Dataflow, Pub/Sub, Looker |

## Current Cloud Computing Market Share (2026)

| Provider | Market Share | YoY Revenue Growth |
|---|---|---|
| **AWS** | 30% | 20% |
| **Microsoft Azure** | 23% | 40% |
| **Google Cloud (GCP)** | 13% | 28% |
| **Others** (Alibaba, Oracle, etc.) | 34% | Varies |

### Key Facts (2026)

- The global cloud market is valued at approximately **$917 billion in 2026**
- Public cloud now accounts for **45% of enterprise IT spending**, up from 17% in 2021
- **87% of organisations** run a multi-cloud strategy
- **AI-related cloud spend** makes up 19% of total cloud spend, up from 8% in 2023
- Azure is now used by **85% of Fortune 500 companies**

## What Do You Usually Pay For in the Cloud

Cloud pricing is based on consumption of individual resources, some common billing are:

| Resource | How It's Billed | Example |
|---|---|---|
| **Compute** | Per hour of virtual machine usage | Running a server for 10 hours |
| **Storage** | Per GB stored per month | Storing files in S3 or Azure Blob |
| **Data transfer** | Per GB transferred out of the cloud | Downloading data to your laptop |
| **Database** | Per instance hour or storage used | Running a managed PostgreSQL database |
| **Serverless** | Per function invocation | Running a script triggered by an event |
| **Support plans** | Monthly flat fee | Access to 24/7 technical support |

### Important Notes

- **Data ingress**: (uploading data into the cloud) is usually free
- **Data egress**: (downloading data out of the cloud) is where costs can surprise you
- **Reserved instances**: committing to 1–3 years of usage gives significant discounts (up to 60–70%) vs on-demand pricing
- **Spot instances**: spare capacity sold cheaply (up to 90% off) but can be switched off by the provider at short notice

## Examples of Cloud Data Services

As a data engineer, these are the core managed services you'll encounter across the major providers:

### Object Storage (Data Lakes)

| Service | Provider | Purpose |
|---|---|---|
| **Amazon S3** | AWS | Industry-standard object storage, where most AWS data is stored and built upon |
| **Azure Data Lake Storage (ADLS)** | Azure | Object storage optimised for analytics workloads |
| **Google Cloud Storage (GCS)** | GCP | Object storage used as the foundation for GCP data pipelines |

### Data Warehouses

| Service | Provider | Purpose |
|---|---|---|
| **Amazon Redshift** | AWS | Columnar data warehouse, tightly integrated with AWS ecosystem |
| **Azure Synapse Analytics** | Azure | Unified analytics platform combining data warehouse, data lake and Power BI |
| **Google BigQuery** | GCP | Serverless, fully-managed data warehouse, widely regarded as best-in-class for analytics |
| **Snowflake** | Multi-cloud | Cloud-agnostic data warehouse, popular for its clean separation of storage and compute |
| **Databricks** | Multi-cloud | Data lakehouse platform built on Apache Spark |

### Data Pipeline & ETL (Extract, Transform, Load) Services

| Service | Provider | Purpose |
|---|---|---|
| **AWS Glue** | AWS | Serverless ETL and data catalogue |
| **Azure Data Factory** | Azure | Managed ETL/ELT pipeline orchestration |
| **Google Cloud Dataflow** | GCP | Managed batch and streaming pipelines |

### Streaming & Messaging

| Service | Provider | Purpose |
|---|---|---|
| **Amazon Kinesis** | AWS | Real-time data streaming ingestion |
| **Azure Event Hubs** | Azure | High-throughput event streaming |
| **Google Pub/Sub** | GCP | Asynchronous messaging and event-driven pipelines |

## Cloud Certifications you can target as a Data Professionals

### Entry-Level / Foundational

| Certification | Provider | What it covers |
|---|---|---|
| **AWS Cloud Practitioner** | AWS | Cloud concepts, core AWS services, pricing |
| **AZ-900: Azure Fundamentals** | Microsoft | Core Azure concepts, cloud models, pricing |
| **Google Cloud Digital Leader** | Google | Cloud concepts and Google Cloud products at a business level |

### Core Data Engineering Certifications

| Certification | Provider | What it covers |
|---|---|---|
| **AWS Certified Data Engineer – Associate** | AWS | S3, Glue, Redshift, Kinesis, Athena, data pipeline design |
| **DP-203: Azure Data Engineer Associate** | Microsoft | Synapse, Data Factory, ADLS, Databricks on Azure, streaming |
| **DP-700: Microsoft Fabric Data Engineer** | Microsoft | Microsoft Fabric - great value at £165 with free renewals |
| **Professional Data Engineer** | Google Cloud | BigQuery, Dataflow, Pub/Sub - one of the hardest and best-paid certs |

### Recommended Path

1. Start with a foundational cert - AWS Cloud Practitioner or AZ-900
2. Pick your primary cloud platform based on your employer or bootcamp
3. Get the core data engineering cert for that platform
4. Add Databricks Certified Data Engineer Associate - it's cloud-agnostic and very common in industry

### What is Databricks?

Databricks is a cloud-based data platform built on top of Apache Spark. It provides a unified environment for data engineering, data science, and machine learning.

It is extremely popular in the industry because:

- It works across all three major clouds (AWS, Azure, GCP)
- It is particularly strong at large-scale data processing and ML pipelines
- It is cloud-agnostic - skills transfer between providers

You write Python or SQL, but Databricks runs it across multiple machines at once, making it capable of processing huge amounts of data quickly.