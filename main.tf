# S3 Bucket
resource "aws_s3_bucket" "aws_s3_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# Logging Target Bucket (for access logs)
resource "aws_s3_bucket" "aws_s3_bucket_logs" {
  bucket = var.bucket_name

  tags = {
    Name        = var.logging_bucket_name
    Environment = var.environment
    ManagedBy   = "Terraform"
    Purpose     = "S3 Access Logs"
  }
}

# Logging Target Bucket Policy (allow log writes from source bucket)
data "aws_iam_policy_document" "aws_s3_bucket_logs_policy" {
  statement {
    sid    = "AWSLogDeliveryWrite"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["logging.s3.amazonaws.com"]
    }

    actions = [
    "s3:PutObject"
    ]

    resources = [
    "${aws_s3_bucket.aws_s3_bucket_logs.arn}/*"
    ]

    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
  }

  statement {
    sid    = "AWSLogDeliveryAclCheck"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["logging.s3.amazonaws.com"]
    }

    actions = [
    "s3:GetBucketAcl"
    ]

    resources = [
    aws_s3_bucket.aws_s3_bucket_logs.arn
    ]
  }
}

resource "aws_s3_bucket_policy" "aws_s3_bucket_logs_policy" {
  bucket = aws_s3_bucket.aws_s3_bucket_logs.id
  policy = data.aws_iam_policy_document.aws_s3_bucket_logs_policy.json
}

# Enable versioning on main bucket
resource "aws_s3_bucket_versioning" "aws_s3_bucket_versioning" {
  bucket = aws_s3_bucket.aws_s3_bucket.id
  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Suspended"
  }
}

# Enable server-side encryption on main bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "aws_s3_bucket_sse" {
  bucket = aws_s3_bucket.aws_s3_bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Enable access logging on main bucket
resource "aws_s3_bucket_logging" "aws_s3_bucket_logging" {
  bucket = aws_s3_bucket.aws_s3_bucket.id

  target_bucket = aws_s3_bucket.aws_s3_bucket_logs.id
  target_prefix = var.logging_target_prefix

  depends_on = [aws_s3_bucket_policy.aws_s3_bucket_logs_policy]
}
