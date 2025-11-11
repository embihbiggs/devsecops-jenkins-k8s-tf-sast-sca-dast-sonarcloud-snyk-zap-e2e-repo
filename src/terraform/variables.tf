variable "aws_region" { type = string; default = "us-east-1" }
variable "project_prefix" { type = string; default = "Capstone" }
variable "vpc_name" { type = string; default = "capstone_vps" }
variable "vpc_cidr" { type = string; default = "10.0.0.0/16" }
variable "public_subnets" { type = list(string); default = ["10.0.0.0/24","10.0.1.0/24"] }
variable "private_subnets" { type = list(string); default = ["10.0.100.0/24","10.0.101.0/24"] }
variable "eks_node_instance_type" { type = string; default = "t3.micro" }
variable "eks_node_desired_capacity" { type = number; default = 2 }
variable "s3_bucket_name" { type = string; default = "capstone_bucket" }
variable "dast_target_url" { type = string; default = "" }
variable "enable_pci" { type = bool; default = false }
variable "securityhub_standards_arns" { type = list(string); default = [
"arn:aws:securityhub:us-east-1::standards/aws-foundational-security-best-practices/v/1.0.0",
"arn:aws:securityhub:us-east-1::standards/cis-aws-foundations-benchmark/v/3.0.0",

] }