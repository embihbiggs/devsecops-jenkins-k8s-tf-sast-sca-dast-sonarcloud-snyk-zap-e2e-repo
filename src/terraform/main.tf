module "vpc" {
source = "./modules/vpc"
project_prefix = var.project_prefix
vpc_cidr = var.vpc_cidr
public_subnets = var.public_subnets
private_subnets = var.private_subnets
}


module "s3_kms" {
source = "./modules/s3_kms"
project_prefix = var.project_prefix
s3_bucket_name = var.s3_bucket_name
}


module "iam" {
source = "./modules/iam"
project_prefix = var.project_prefix
}


module "eks" {
source = "./modules/eks"
project_prefix = var.project_prefix
vpc_id = module.vpc.vpc_id
public_subnet_ids = module.vpc.public_subnet_ids
private_subnet_ids = module.vpc.private_subnet_ids
eks_node_instance_type = var.eks_node_instance_type
eks_node_desired_capacity = var.eks_node_desired_capacity
}


module "security_services" {
source = "./modules/iam" # small security resources are in iam module; extend as needed
project_prefix = var.project_prefix
}


module "dast" {
source = "./modules/eks" # reuse eks module outputs for DAST wiring; the DAST ECS is created in eks module
project_prefix = var.project_prefix
target_url = var.dast_target_url
}