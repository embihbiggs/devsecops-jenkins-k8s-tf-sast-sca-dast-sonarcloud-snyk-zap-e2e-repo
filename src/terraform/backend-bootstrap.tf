##############################
# S3 Bucket for Terraform State
##############################
terraform {
  backend "s3" {
    bucket         = "capstone-tfstate-237"
    key            = "global/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "capstone-tfstate-lock"
    encrypt        = true
  }
}


# #########################################
# # Bucket Versioning (new required resource)
# #########################################
# resource "aws_s3_bucket_versioning" "tfstate_versioning" {
#   bucket = aws_s3_bucket.tfstate.id

#   versioning_configuration {
#     status = "Enabled"
#   }
# }

# #########################################################
# # Server-Side Encryption (new required resource)
# #########################################################
# resource "aws_s3_bucket_server_side_encryption_configuration" "tfstate_sse" {
#   bucket = aws_s3_bucket.tfstate.bucket

#   rule {
#     apply_server_side_encryption_by_default {
#       sse_algorithm = "AES256"
#     }
#   }
# }

# #########################################################
# # Public Access Block (best practice for TF state bucket)
# #########################################################
# resource "aws_s3_bucket_public_access_block" "tfstate_pab" {
#   bucket = aws_s3_bucket.tfstate.id

#   block_public_acls       = true
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true
# }

# ##############################
# # DynamoDB Lock Table
# ##############################
# resource "aws_dynamodb_table" "tf_locks" {
#   name         = "${var.project_prefix}-tfstate-locks"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }

#   tags = {
#     Name = "Terraform State Lock Table"
#   }
# }
