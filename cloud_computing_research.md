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

