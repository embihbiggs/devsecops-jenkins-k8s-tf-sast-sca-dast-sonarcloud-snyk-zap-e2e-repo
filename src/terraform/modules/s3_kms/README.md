# S3 + KMS Module

Creates:
- Encrypted S3 bucket for artifacts
- KMS key and alias for encryption

## Inputs
- `bucket_name`: Name of the S3 bucket

## Outputs
- `bucket_name`: ID of the created bucket
- `kms_key_arn`: ARN of the KMS key
