# 🏗️ Terraform Infrastructure as Code

## 📋 Project Overview
This Terraform configuration creates AWS infrastructure based on the following request:

> **Create S3 bucket named autoscript-pro-test-bucket-123**

**Target Region:** `us-east-1`
**Generated:** 6 files
**Resources:** 5 AWS resource types

---

## 🚀 AWS Resources

This configuration will create the following AWS resources:

- **aws_s3_bucket** (`aws_s3_bucket_logs`)
- **aws_s3_bucket** (`aws_s3_bucket`)
- **aws_s3_bucket_logging** (`aws_s3_bucket_logging`)
- **aws_s3_bucket_policy** (`aws_s3_bucket_logs_policy`)
- **aws_s3_bucket_server_side_encryption_configuration** (`aws_s3_bucket_sse`)
- **aws_s3_bucket_versioning** (`aws_s3_bucket_versioning`)

---

## 📁 Project Structure

### `main.tf`
**Core Infrastructure Definition** - Contains all AWS resource definitions, including their configurations, dependencies, and relationships. This is the primary file that defines what infrastructure will be created.

### `variables.tf`
**Input Variables Declaration** - Defines all configurable parameters for the infrastructure. Variables declared here can be customized in terraform.tfvars or passed via command line.

### `outputs.tf`
**Output Values Definition** - Specifies what information should be displayed after successful deployment, such as resource IDs, URLs, or connection strings.

### `provider.tf`
**Provider Configuration** - Configures the AWS provider settings, including region, authentication, and any provider-specific options.

### `terraform.tfvars`
**Variable Values** - Contains actual values for the variables defined in variables.tf. Edit this file to customize your deployment without modifying the core Terraform code.

---

## ⚙️ Configuration Variables

The following variables can be customized in `terraform.tfvars`:

- **aws_region**: AWS region to deploy resources in.
- **bucket_name**: The name of the S3 bucket. Must be globally unique.
- **enable_versioning**: Enable versioning for the S3 bucket.
- **environment**: Environment tag for resources.
- **logging_bucket_name**: The name of the S3 bucket to store access logs. Must be globally unique.
- **logging_target_prefix**: Prefix for access log object keys in the logging bucket.

---

## 📤 Outputs

After deployment, the following outputs will be available:

- **s3_bucket_id**: The name of the S3 bucket.
- **s3_bucket_arn**: The ARN of the S3 bucket.
- **s3_bucket_region**: The AWS region this bucket resides in.
- **s3_bucket_logging_bucket_id**: The name of the S3 bucket used for access logs.
- **s3_bucket_logging_bucket_arn**: The ARN of the S3 bucket used for access logs.

---

## 🚀 Quick Start

### Prerequisites
- **Terraform** v1.0.0+ ([Download](https://www.terraform.io/downloads.html))
- **AWS CLI** configured with appropriate credentials
- **AWS Account** with necessary permissions for the resources above

### Step-by-Step Deployment

1. **Clone/Download** this Terraform configuration

2. **Configure Variables** (Optional)
```bash
# Edit terraform.tfvars to customize your deployment
nano terraform.tfvars
```

3. **Initialize Terraform**
```bash
terraform init
```

4. **Review the Plan**
```bash
terraform plan
```
📋 *Review the output to understand what resources will be created*

5. **Deploy Infrastructure**
```bash
terraform apply
```
⚠️ *Type `yes` when prompted to confirm deployment*

6. **View Outputs** (if any)
```bash
terraform output
```

### 🧹 Cleanup

When you no longer need the infrastructure:

```bash
terraform destroy
```
⚠️ *This will permanently delete all created resources*

---

## 🔧 Advanced Usage

### Environment-Specific Deployments
```bash
# Development environment
terraform workspace new dev
terraform apply -var-file="dev.tfvars"

# Production environment
terraform workspace new prod
terraform apply -var-file="prod.tfvars"
```

### State Management
This project uses **repository-based state management** for workflow continuity:

```bash
# View current state
terraform show

# List resources in state
terraform state list

# Import existing resources (example)
terraform import [resource_type].[resource_name] [resource_id]
```

**State File Location:**
- `terraform.tfstate` - Stored in this repository
- `.terraform/` - Terraform configuration directory (also in repository)
- Automatically managed by GitHub Actions workflows
- State is committed after each plan/apply operation

---

## 🛡️ Security Best Practices

- ✅ **Credentials**: Never commit AWS credentials to version control
- ✅ **State Files**: Use remote state storage for production
- ✅ **Variables**: Use environment variables or `.tfvars` files for sensitive data
- ✅ **Permissions**: Follow principle of least privilege for AWS access
- ✅ **Encryption**: Enable encryption for sensitive resources

---

## 📚 Additional Resources

- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS CLI Configuration Guide](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)
- [Terraform Best Practices](https://www.terraform.io/docs/cloud/guides/recommended-practices/index.html)

---

## 🆘 Troubleshooting

### Common Issues

**Issue**: `terraform init` fails
- **Solution**: Check internet connectivity and Terraform version

**Issue**: AWS authentication errors
- **Solution**: Verify AWS CLI configurationwith `aws sts get-caller-identity`

**Issue**: Resource already exists errors
- **Solution**: Import existing resources or use different names

**Issue**: Permission denied errors
- **Solution**: Check IAM permissions for your AWS user/role

---

*Generated by Terraform AI Agent - AWS us-east-1 deployment*
