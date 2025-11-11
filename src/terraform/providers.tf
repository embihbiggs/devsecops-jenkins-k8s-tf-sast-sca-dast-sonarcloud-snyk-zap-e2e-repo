terraform {
required_version = ">= 1.5.0"
required_providers {
aws = { source = "hashicorp/aws"; version = ">= 4.50.0" }
local = { source = "hashicorp/local"; version = ">= 2.2.0" }

}

backend "s3" {
bucket = "capstone_bucket"
key = "capstone/terraform.tfstate"
region = "us-east-1"
dynamodb_table = "Capstone-tfstate-locks"
encrypt = true
}

}


provider "aws" {
region = var.aws_region
}