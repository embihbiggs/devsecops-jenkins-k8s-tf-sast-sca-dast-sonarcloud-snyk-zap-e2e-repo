resource "aws_s3_bucket" "tfstate" {
bucket = var.s3_bucket_name
acl = "private"
server_side_encryption_configuration {
rule {
apply_server_side_encryption_by_default {
sse_algorithm = "AES256"
}
}
}

versioning { enabled = true }
tags = { Name = "${var.project_prefix}-tfstate" }
lifecycle { prevent_destroy = true }
}


resource "aws_dynamodb_table" "tf_locks" {
name = "${var.project_prefix}-tfstate-locks"
billing_mode = "PAY_PER_REQUEST"
hash_key = "LockID"
attribute { name = "LockID"; type = "S" }
tags = { Name = "${var.project_prefix}-tf-locks" }
}