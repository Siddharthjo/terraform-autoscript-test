# Terraform Variables
# Edit these values according to your requirements

# AWS region to deploy resources in.
aws_region = "us-east-1"

# The name of the S3 bucket. Must be globally unique.
bucket_name = "autoscript-pro-test-bucket-123"

# Enable versioning for the S3 bucket.
enable_versioning = true

# Environment tag for resources.
environment = "production"

# The name of the S3 bucket to store access logs. Must be globally unique.
logging_bucket_name = "${var.bucket_name}-logs"

# Prefix for access log object keys in the logging bucket.
logging_target_prefix = "logs/"

