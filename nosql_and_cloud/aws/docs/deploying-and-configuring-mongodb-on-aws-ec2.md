# Deploying and Configuring MongoDB on AWS EC2 with External Connection Support

This document covers how to provision and deploy MongoDB on an AWS EC2 instance using a bash script, configure it to accept external connections, and test connectivity from another EC2 instance.

## EC2 Instance Setup

Launch a new EC2 instance in the AWS console with the following settings:

- **AMI**: Ubuntu 24.04 LTS
- **Instance type**: t3.micro
- **Storage**: unchanged (default)
- **Security Group inbound rules**:
  - Port **22** — SSH
  - Port **27017** — MongoDB

Once the instance is running, find the **Public IPv4 address** in the instance details panel.

## SSH Into the Instance

```bash
ssh -i "your-key.pem" ubuntu@<public-ip>
```

## The Provision Script

Create the provision script:

```bash
nano provision-mongodb.sh
```

Paste the following:

```bash
#!/bin/bash

# Update and upgrade
sudo apt update -y
sudo apt upgrade -y

# Install gnupg and curl (needed to fetch the GPG key)
sudo apt install gnupg curl -y

# Fetch MongoDB 8.0 GPG key
curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc | \
  sudo gpg -o /usr/share/keyrings/mongodb-server-8.0.gpg --dearmor

# Add MongoDB 8.0 repository for Ubuntu 24.04 (noble)
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] \
  https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0 multiverse" | \
  sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list

# Update apt so it knows about the new repo
sudo apt update -y

# Install MongoDB
sudo apt install mongodb-org -y

# Enable and start MongoDB
sudo systemctl enable mongod
sudo systemctl start mongod

# Allow external connections
# Default config binds to 127.0.0.1 (localhost only) — change to 0.0.0.0
sudo sed -i 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/' /etc/mongod.conf

# Restart MongoDB to apply config change
sudo systemctl restart mongod
```

Save and exit: `Ctrl+X` → `Y` → `Enter`

## Running the Script

```bash
chmod +x provision-mongodb.sh
./provision-mongodb.sh
```

## What the Script Does — Step by Step

### 1. Update and upgrade
```bash
sudo apt update -y
sudo apt upgrade -y
```
Refreshes the package list and upgrades existing packages to their latest versions.

### 2. Install gnupg and curl
```bash
sudo apt install gnupg curl -y
```
- **curl** — downloads files from URLs (used to fetch the GPG key)
- **gnupg** — handles GPG keys (used to store and verify the key)

### 3. Fetch the GPG key
```bash
curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc | \
  sudo gpg -o /usr/share/keyrings/mongodb-server-8.0.gpg --dearmor
```
A **GPG key** is a cryptographic signature from MongoDB that proves packages downloaded from their repository are genuine and haven't been tampered with. Without it, Ubuntu refuses to install from that repo.

- `curl` fetches the key from MongoDB's official key server
- `gpg --dearmor` converts it from text format to binary and saves it to `/usr/share/keyrings/`
- The `|` (pipe) passes the output of `curl` directly into `gpg`

### 4. Add the MongoDB repository
```bash
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] \
  https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0 multiverse" | \
  sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list
```
By default, Ubuntu doesn't know where to find MongoDB packages. This adds MongoDB's official repository as a trusted source for `apt` to install from.

- `noble` refers to Ubuntu 24.04's codename
- `signed-by` links the repo to the GPG key we just saved
- `tee` writes the output to the file (equivalent to saving it)

> **Note**: MongoDB 7.0 does not support Ubuntu 24.04 — use **8.0** for `noble`.

### 5. Update apt
```bash
sudo apt update -y
```
Runs again so apt picks up the newly added MongoDB repository.

### 6. Install MongoDB
```bash
sudo apt install mongodb-org -y
```
Installs the MongoDB server (`mongod`) and associated tools.

### 7. Enable and start MongoDB
```bash
sudo systemctl enable mongod
sudo systemctl start mongod
```
- `enable` — makes MongoDB start automatically if the EC2 instance reboots
- `start` — starts MongoDB immediately

### 8. Allow external connections (sed command)
```bash
sudo sed -i 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/' /etc/mongod.conf
```
By default, MongoDB only accepts connections from `127.0.0.1` (localhost — the same machine). This means no other server can connect to it.

- `sed` is a stream editor — it finds and replaces text in files
- `-i` edits the file in-place (saves the change directly)
- `s/old/new/` is the substitute syntax
- `0.0.0.0` means "accept connections on all network interfaces" — allowing the nginx EC2 to connect

This is the equivalent of a find-and-replace in a text editor, but scriptable.

### 9. Restart MongoDB
```bash
sudo systemctl restart mongod
```
Restarts MongoDB so it picks up the config change made by `sed`.

## Verify MongoDB is Running

```bash
systemctl status mongod
```

Should show `active (running)`.

## Verify External Connections are Enabled

```bash
grep bindIp /etc/mongod.conf
```

Should return:

```
bindIp: 0.0.0.0
```

## Testing the Connection from the nginx EC2

To confirm the nginx EC2 can reach MongoDB, SSH into the nginx EC2 and use `telnet`:

```bash
telnet <mongodb-private-ip> 27017
```

Use the **private IP** of the MongoDB EC2 (the `172.x.x.x` address) — both instances are in the same AWS VPC (Virtual Private Cloud), so they can talk to each other over the private network without going out to the internet.

A successful connection looks like:

```
Trying 172.31.x.x...
Connected to 172.31.x.x.
```

If it hangs or times out, check:
1. The MongoDB EC2 security group allows inbound traffic on port 27017
2. MongoDB is running (`systemctl status mongod`)
3. `bindIp` is set to `0.0.0.0` in `/etc/mongod.conf`

## AWS Security Group Note

In production, restrict port 27017 to only accept traffic from your nginx EC2's **private IP** — not `0.0.0.0/0`. Exposing MongoDB to the whole internet is a serious security risk.

In the AWS console: **Security Group → Inbound rules → Port 27017 → Source = nginx EC2 private IP**.