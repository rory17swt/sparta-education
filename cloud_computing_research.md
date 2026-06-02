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