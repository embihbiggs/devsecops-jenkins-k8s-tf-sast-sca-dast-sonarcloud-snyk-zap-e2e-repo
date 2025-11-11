output "artifact_bucket_name" {
  value = aws_s3_bucket.artifact.bucket
}

output "tfstate_bucket_name" {
  value = aws_s3_bucket.tfstate.bucket
}

output "kms_key_arn" {
  value = aws_kms_key.artifact_key.arn
}
