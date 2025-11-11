variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "s3_bucket_name" {
  type        = string
  description = "capstone s3 bucket"
}

variable "cluster_name" {
  type        = string
  description = "capstone"
}

variable "cluster_version" {
  type        = string
  description = "Kubernetes version for the EKS cluster"
}

variable "node_groups" {
  type        = map(any)
  description = "Node group configuration for EKS"
}

variable "region" {
  type = string
  description = "AWS region to deploy resources in"
}

variable "project_prefix" {
  type        = string
  description = "Prefix used for naming resources"
}
