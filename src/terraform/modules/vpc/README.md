# VPC Module

Creates a VPC with:
- Public subnets across availability zones
- Internet Gateway

## Inputs
- `vpc_cidr`: CIDR block for the VPC

## Outputs
- `vpc_id`: ID of the created VPC
- `public_subnet_ids`: List of public subnet IDs
