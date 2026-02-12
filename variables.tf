variable "aws_region" {
  description = "AWS region to deploy resources in."
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "The name of the S3 bucket. Must be globally unique."
  type        = string
}

variable "enable_versioning" {
  description = "Enable versioning for the S3 bucket."
  type        = bool
  default     = true
}

variable "environment" {
  description = "Environment tag for resources."
  type        = string
  default     = "production"
}

variable "logging_bucket_name" {
  description = "The name of the S3 bucket to store access logs. Must be globally unique."
  type        = string
  default     = "${var.bucket_name}-logs"
}

variable "logging_target_prefix" {
  description = "Prefix for access log object keys in the logging bucket."
  type        = string
  default     = "logs/"
}
