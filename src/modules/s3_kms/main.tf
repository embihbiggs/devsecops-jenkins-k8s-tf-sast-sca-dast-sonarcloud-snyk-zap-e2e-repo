resource "aws_kms_key" "capstone" {
description = "KMS key for ${var.project_prefix}"
deletion_window_in_days = 30
tags = { Name = "${var.project_prefix}-kms" }
}


resource "aws_kms_alias" "capstone_alias" {
name = "alias/${var.project_prefix}-kms"
target_key_id = aws_kms_key.capstone.key_id
}


resource "aws_s3_bucket" "artifacts" {
bucket = var.s3_bucket_name
acl = "private"
server_side_encryption_configuration {
rule {
apply_server_side_encryption_by_default {
sse_algorithm = "aws:kms"
kms_master_key_id = aws_kms_key.capstone.arn
}
}
}
versioning { enabled = true }
tags = { Name = "${var.project_prefix}-artifacts" }
}


resource "aws_s3_bucket_public_access_block" "artifacts_block" {
bucket = aws_s3_bucket.artifacts.id
block_public_acls = true
block_public_policy = true
ignore_public_acls = true
restrict_public_buckets = true
}