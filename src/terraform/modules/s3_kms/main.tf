resource "aws_kms_key" "artifact_key" {
  description             = "KMS key for artifact bucket"
  deletion_window_in_days = 10
  enable_key_rotation     = true
  tags = {
    Name = "artifact-kms-key"
  }
}

resource "aws_kms_alias" "artifact_alias" {
  name          = "alias/artifact-key"
  target_key_id = aws_kms_key.artifact_key.id
}

resource "aws_s3_bucket" "artifact" {
  bucket = var.bucket_name
  tags = {
    Name = "artifact-bucket"
  }
}

resource "aws_s3_bucket" "tfstate" {
  bucket = "my-tfstate-bucket"
}

resource "aws_s3_bucket_versioning" "tfstate_versioning" {
  bucket = aws_s3_bucket.tfstate.id

  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_server_side_encryption_configuration" "tfstate_encryption" {
  bucket = aws_s3_bucket.tfstate.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = aws_kms_key.artifact_key.arn
    }
  }
}