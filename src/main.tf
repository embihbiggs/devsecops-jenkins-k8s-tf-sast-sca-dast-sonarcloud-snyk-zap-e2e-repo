terraform {
  required_version = ">= 1.3"
  backend "s3" {
    bucket = "my-terraform-state-bucket"
    key    = "envs/${terraform.workspace}/terraform.tfstate"
    region = var.aws_region
    encrypt = true
    dynamodb_table = "terraform-locks"
  }
}

provider "aws" {
  region = var.aws_region
}