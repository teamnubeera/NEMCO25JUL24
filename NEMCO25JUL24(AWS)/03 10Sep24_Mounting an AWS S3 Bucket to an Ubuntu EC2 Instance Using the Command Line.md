# Mounting an AWS S3 Bucket to an Ubuntu EC2 Instance Using the Command Line


### Step 1: Install dependencies

```bash
sudo apt update
sudo apt install s3fs -y
```

### Step 2: Create AWS credentials file

Create a file to store your AWS credentials:

```bash
echo "AWS_ACCESS_KEY_ID:AWS_SECRET_ACCESS_KEY" > ~/.passwd-s3fs
chmod 600 ~/.passwd-s3fs
```

Replace `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` with your actual AWS access keys.

### Step 3: Create a mount point

```bash
sudo mkdir /mnt/mybucket
```

Replace `mybucket` with the name you want for the mount directory.

### Step 4: Mount the S3 bucket

```bash
s3fs my-bucket-name /mnt/mybucket -o passwd_file=~/.passwd-s3fs
```

Replace `my-bucket-name` with the actual name of your S3 bucket.

### Step 5: Verify the mount

You can verify that the bucket is mounted using the `df -h` command:

```bash
df -h
```

Now, your S3 bucket is mounted to `/mnt/mybucket`, and you can interact with it like a local directory.

### Step 6: Automate mounting on startup (Optional)

To ensure the S3 bucket is mounted automatically on system startup, you can add the following entry to `/etc/fstab`:

```bash
echo "s3fs#my-bucket-name /mnt/mybucket fuse _netdev,passwd_file=/home/ubuntu/.passwd-s3fs 0 0" | sudo tee -a /etc/fstab
```
