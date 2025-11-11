output "bucket_id" { value = aws_s3_bucket.artifacts.id }
output "kms_key_arn" { value = aws_kms_key.capstone.arn }