# Auto Deploying Nginx on AWS EC2

## Overview

This document covers how to provision and deploy nginx on an AWS EC2 instance using a bash script.

---

## EC2 Instance Setup

Launch a new EC2 instance in the AWS console with the following settings:

- **AMI**: Ubuntu 24.04 LTS
- **Instance type**: t3.micro
- **Storage**: unchanged (default)
- **Security Group inbound rules**:
  - Port **22** — SSH
  - Port **80** — HTTP

Once the instance is running, find the **Public IPv4 address** in the instance details panel (not the private 172.x.x.x address).

---

## SSH Into the Instance

```bash
ssh -i "your-key.pem" ubuntu@<public-ip>
```

> Run this from the directory where your `.pem` file is saved, or use the full path e.g. `~/.ssh/your-key.pem`.

---

## The Provision Script

Once SSH'd in, create the provision script directly on the EC2 instance:

```bash
nano provision-nginx.sh
```

Paste the following:

```bash
#!/bin/bash

# Update and download latest version of packages
sudo apt update -y

# Install latest version of packages
sudo apt upgrade -y

# Install and run nginx web server
sudo apt install nginx -y
```

Save and exit: `Ctrl+X` → `Y` → `Enter`

---

## Running the Script

Make the script executable, then run it:

```bash
chmod +x provision-nginx.sh
./provision-nginx.sh
```

### Why `chmod +x`?

On Linux, new files are created as plain text by default — they are not trusted to run as programs. `chmod +x` adds **execute permission**, telling Linux this file is allowed to be executed as a script.

Without it, running `./provision-nginx.sh` would return a `Permission denied` error.

---

## What the Script Does

| Command | Purpose |
|---|---|
| `apt update -y` | Refreshes the list of available packages |
| `apt upgrade -y` | Installs the latest versions of existing packages |
| `apt install nginx -y` | Installs the nginx web server |

The `-y` flag automatically confirms any prompts so the script runs without user input.

On Ubuntu, nginx starts automatically after install.

---

## Verify nginx is Running

```bash
systemctl status nginx
```

Or visit `http://<your-public-ip>` in a browser — you should see the nginx welcome page.