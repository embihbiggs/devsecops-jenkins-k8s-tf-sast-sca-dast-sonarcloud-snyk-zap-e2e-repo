# EKS Module

Wraps the terraform-aws-modules EKS module.

## Inputs
- `cluster_name`: Name of the EKS cluster
- `cluster_version`: Kubernetes version
- `subnet_ids`: Subnet IDs for the cluster
- `vpc_id`: VPC ID
- `node_groups`: Node group configuration

## Outputs
- `cluster_name`: Name of the created cluster
