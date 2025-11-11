variable "project_prefix" { type = string }
variable "vpc_id" { type = string }
variable "public_subnet_ids" { type = list(string) }
variable "private_subnet_ids" { type = list(string) }
variable "eks_node_instance_type" { type = string }
variable "eks_node_desired_capacity" { type = number }