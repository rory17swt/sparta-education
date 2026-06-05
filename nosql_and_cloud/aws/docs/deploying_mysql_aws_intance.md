# Deploying MySQL on an EC2 Instance (Ubuntu)



## 1. Launch an EC2 Instance

1. Go to **EC2 / Launch Instance** in the AWS Console
2. Configure the following:
   - **Name**: follow nameing convention
   - **AMI**: Ubuntu Server
   - **Instance type**: `t2.micro`
   - **Key pair**: create a new `.pem` key pair or add an existing one
   - **Security Group**
        - In Network setting click Edit
        - Under Firewall (Security Groups)
            - Set a Security Group name and description
            - Click Add Security Group Rule
            - Set Port range to 80
            - Set Source to 0.0.0.0/0 (allows public HTTP access)

3. Launch the instance and wait for status checks to pass

## 2. Set Key Pair Permissions

Before connecting, restrict your `.pem` file permissions. SSH will reject the connection if the file is too open.

```bash
chmod 400 "your-key.pem"
```

## 3. SSH into the Instance

Find the connection command in the AWS Console under **Instance / Connect / SSH client**. It will look like:

```bash
ssh -i "your-key.pem" ubuntu@ec2-xx-xx-xx-xx.eu-central-1.compute.amazonaws.com
```

## 4. Install MySQL Server

Once inside the instance, update the package list and install MySQL:

```bash
sudo apt update && sudo apt install mysql-server -y
```

## 5. Start MySQL and Enable on Boot

Start the MySQL service and configure it to start automatically on instance restart:

```bash
sudo systemctl start mysql
sudo systemctl enable mysql
```

Verify it's running:

```bash
sudo systemctl status mysql
```

You should see `active (running)`.

### Why enable on boot

If your EC2 instance restarts, MySQL will come back up automatically, no need to SSH in and start it manually.

## 6. Secure the Installation

Run the security script to lock down the default MySQL setup:

```bash
sudo mysql_secure_installation
```

## 7. Log into MySQL

On Ubuntu, the root user uses OS-level authentication by default, so log in with:

```bash
sudo mysql
```

You should see the `mysql>` prompt.