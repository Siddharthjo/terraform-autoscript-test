output "s3_bucket_id" {
  description = "The name of the S3 bucket."
  value       = aws_s3_bucket.aws_s3_bucket.id
}

output "s3_bucket_arn" {
  description = "The ARN of the S3 bucket."
  value       = aws_s3_bucket.aws_s3_bucket.arn
}

output "s3_bucket_region" {
  description = "The AWS region this bucket resides in."
  value       = var.aws_region
}

output "s3_bucket_logging_bucket_id" {
  description = "The name of the S3 bucket used for access logs."
  value       = aws_s3_bucket.aws_s3_bucket_logs.id
}

output "s3_bucket_logging_bucket_arn" {
  description = "The ARN of the S3 bucket used for access logs."
  value       = aws_s3_bucket.aws_s3_bucket_logs.arn
}
