# EC2 Nginx Deployment Guide

## 1. Create a Key Pair
- AWS Console / EC2 / Network & Security / Key Pairs
- Click **Create key pair**
- Naming conventions are important - use the format: `se-[your-name]-key-pair`
- The `.pem` file will auto-download to your machine
- Cut the key file and paste it into: `C:\Users\user[your-name]\.ssh\`

> **Note:** If the `.ssh` folder doesn't exist, create it manually.

## 2. Create an EC2 Instance
- EC2 / Instances / **Launch Instance**
- Set a name (follow naming conventions)
- Select **Ubuntu** as the OS (double check version if needed)
- Select your key pair name
- In Network setting click **Edit**
  - Under **Firewall (Security Groups)**:
    - Set a Security Group name and description
    - Click **Add Security Group Rule**
    - Set **Port range** to `80`
    - Set **Source** to `0.0.0.0/0` (allows public HTTP access)
- Click **Launch Instance**
- Click the **Instance ID** link to view your instance

## 3. Connect via SSH (Git Bash)

Click **Connect** at the top. Select the **SSH client** tab. AWS will show you:

- The location of your private key file (e.g. `se-rory-key-pair.pem`)
- The `chmod` command to set permissions
- Your instance's **Public DNS** (e.g. `ec2-34-245-121-75.eu-west-1.compute.amazonaws.com`)
- The full SSH command to copy and paste

Open Git Bash and run the following commands:

```bash
# Check your current directory
pwd

# Navigate to your .ssh folder
cd .ssh

# Set correct permissions on your key file (from the Connect page)
# Only need to do this once per new Key/Value pair
chmod 400 "se-[your-name]-key-pair.pem"

# SSH into your instance (copy the exact command from the Connect page)
ssh -i "se-[your-name]-key-pair.pem" ubuntu@ec2-34-245-121-75.eu-west-1.compute.amazonaws.com
```

When prompted:
```
Are you sure you want to continue connecting (yes/no)?
```
Type `yes` and hit Enter.

## 4. Update & Upgrade Packages

```bash
sudo apt update -y
sudo apt upgrade -y
```

## 5. Install Nginx

```bash
sudo apt install nginx -y
```

## 6. Verify Nginx is Running

```bash
sudo systemctl status nginx
```

You should see `active (running)` in the output.

## 7. Test in Browser

To find you public IP - EC2 / Instances / Search for you instance / Look for the **Public IPv4 column**

Navigate to your instance's public IP in a browser:

```
http://[your-public-ip]/
```

If you see the **nginx welcome page**, the deployment was successful.

## 8. Best Practice: Stop Instances When Not in Use
 
Running instances incur costs even when idle. It is best practice to stop your instances at the end of the day.
 
To stop an instance:
- **EC2 / Instances** / search for your instance
- Select the checkbox next to it
- Click **Instance state** / **Stop instance**
 
> **Note:** Your **Public IPv4 address will change** when you restart a stopped instance. Remember to get the new IP/DNS from the Connect page each time.