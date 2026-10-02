# Terraform AWS Infrastructure Practice

A public-safe Terraform portfolio project for a small AWS application environment in Tokyo (`ap-northeast-1`).

## Architecture

```text
Internet
   |
   v
Application Load Balancer (public subnets)
   |
   v
ECS Fargate (private app subnets)
   |
   +----> RDS PostgreSQL (private DB subnets)
   |
   +----> S3 via Gateway VPC Endpoint

Container images ----> ECR
```

The configuration creates a VPC, two public subnets, two private application subnets, two private database subnets, an Internet Gateway, NAT Gateway, ALB, ECS/Fargate, ECR, PostgreSQL RDS, S3, IAM and Security Groups.

## Security decisions

- No AWS access keys are stored in Terraform code.
- `terraform.tfvars`, Terraform state, crash logs and local Terraform data are excluded from Git.
- RDS is private and only accepts PostgreSQL traffic from the ECS security group.
- ECS tasks run without public IP addresses.
- The S3 bucket blocks all public access.
- The database password is a sensitive Terraform variable and must be supplied locally.

## Usage

```bash
cp terraform.tfvars.example terraform.tfvars
# Set a strong local db_password in terraform.tfvars

terraform init
terraform fmt -recursive
terraform validate
terraform plan
terraform apply
```

Terraform uses the standard AWS credential chain, such as an AWS CLI profile, environment variables, or an IAM role.

> **Cost warning:** NAT Gateway, ALB, ECS and RDS are billable AWS resources. Review the plan and AWS pricing before applying, and destroy practice resources when they are no longer needed.

## Purpose

This project was refactored from hands-on AWS/Terraform practice into a consistent portfolio example. It demonstrates Infrastructure as Code, network segmentation, container deployment, managed database integration, IAM, and basic AWS security practices.
