# 🚀 Deploy a Static Website on AWS S3 using Terraform

This project demonstrates how to deploy a static website on AWS S3 using Terraform in a fully automated way.

Instead of manually configuring AWS resources through the console, this project uses Infrastructure as Code (IaC) to provision and configure the entire infrastructure.

With a single command, Terraform will:
- Create an S3 bucket
- Configure static website hosting
- Upload website files
- Make the bucket publicly accessible
- Generate the website endpoint automatically

The entire deployment can be completed in a few seconds using Terraform automation.

## 📌 Project Architecture

User
  │
  ▼
Terraform
  │
  ▼
AWS S3 Bucket
  │
  ▼
Static Website Hosting
  │
  ▼
Public Website Endpoint

The website is hosted using Amazon S3 Static Website Hosting.

## 📂 Project Structure
.
├── src
│   ├── error.html
│   ├── index.html
│   └── profile.png
├── terraform
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── LICENSE
└── README.md

File Description

| File           | Purpose                                     |
| -------------- | ------------------------------------------- |
| `terraform/`   | Directory for Terraform configuration files.|
| `main.tf`      | Creates S3 bucket and website configuration |
| `variables.tf` | Stores Terraform variables                  |
| `outputs.tf`   | Displays website endpoint                   |
| `src/`         | Directory for website source files.         |
| `index.html`   | Main website page                           |
| `error.html`   | Error page                                  |
| `profile.png`  | Sample image used in the website            |


### ⚙️ Prerequisites

Before running this project, ensure you have:

### 1️⃣ AWS Account

You need an active AWS account.

### 2️⃣ Terraform Installed

Verify Terraform installation:
terraform --version

Install Terraform if needed:

https://developer.hashicorp.com/terraform/downloads

### 3️⃣ AWS Credentials Configured

Configure AWS CLI:
aws configure

## 🏗 Step 1: Initialize Terraform

`cd` into the `terraform` directory and initialize Terraform to download required provider plugins.

cd terraform
terraform init

This will download the AWS provider plugin.

## ☁️ Step 2: Create the S3 Bucket

Terraform will create an S3 bucket using the following configuration.

Example:

resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucket_name
}

### ⚠️ Note:

S3 bucket names must be globally unique across AWS.


## 🔓 Step 3: Configure Bucket Permissions

To host a static website, the bucket must allow public access.

Terraform configures:
- Ownership controls
- Public access block settings
- Access Control List (ACL)

Example:
resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.mybucket.id
  acl    = "public-read"
}

This ensures the website content is publicly accessible.

## 🌐 Step 4: Enable Static Website Hosting

Terraform enables website hosting using:
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.mybucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

This allows S3 to serve the website using:

index.html
error.html

## 📤 Step 5: Upload Website Files

Terraform uploads website files automatically.

Example resource:

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.mybucket.id
  key    = "index.html"
  source = "../src/index.html"

  acl          = "public-read"
  content_type = "text/html"
}

Files uploaded:

index.html

error.html

profile.png

## 🚀 Step 6: Deploy Infrastructure

Run Terraform plan:
- terraform plan

Deploy infrastructure:
- terraform apply -auto-approve

Terraform will:
- Create bucket
- Configure permissions
- Upload files
- Enable website hosting

## 🌍 Step 7: Access Your Website

Terraform outputs the website endpoint automatically.

Example output:
http://your-bucket-name.s3-website-us-east-1.amazonaws.com

Open this URL in a browser to view your website.

## 🧪 Testing the Website

You can test your website by:

1️⃣ Opening the S3 website endpoint
2️⃣ Accessing index.html
3️⃣ Triggering error.html by navigating to a non-existent page


## 🌐 Optional: Custom Domain with Route53

If you own a domain, you can map the S3 website endpoint to your domain.

Steps:

#### 1️⃣ Create Route53 hosted zone
#### 2️⃣ Create an alias record
#### 3️⃣ Point it to the S3 website endpoint

www.mywebsite.com → S3 Website Endpoint

### 🔄 Destroy Infrastructure

To remove all resources, run the following command from within the `terraform` directory:
terraform destroy

Terraform will delete:
- S3 bucket
- Uploaded objects
- Website configuration

⭐ Future Improvements

Possible enhancements:
- Add CloudFront CDN
- Enable HTTPS with ACM
- Add CI/CD pipeline with GitHub Actions
- Enable S3 logging
- Add Terraform remote state

🙌 Contribution

Feel free to fork this repository and enhance the project.

Pull requests are welcome!