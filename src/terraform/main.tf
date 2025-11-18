module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "s3_kms" {
  source      = "./modules/s3_kms"
  bucket_name = var.s3_bucket_name
}

module "iam" {
  source = "./modules/iam"
}

module "eks_cluster" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.8.0"

  name               = var.cluster_name
  kubernetes_version = var.cluster_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnet_ids

  eks_managed_node_groups = {
    default = {
      desired_size   = 2
      max_size       = 3
      min_size       = 1
      instance_types = ["t3.micro"]
      capacity_type  = "ON_DEMAND"
    }
  }
}


resource "aws_s3_bucket_policy" "tfstate_policy" {
  bucket = module.s3_kms.tfstate_bucket_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          "arn:aws:s3:::${module.s3_kms.tfstate_bucket_name}",
          "arn:aws:s3:::${module.s3_kms.tfstate_bucket_name}/*"
        ]
        Condition = {
          Bool = {
            "aws:SecureTransport" = "false"
          }
        }
      }
    ]
  })
}


