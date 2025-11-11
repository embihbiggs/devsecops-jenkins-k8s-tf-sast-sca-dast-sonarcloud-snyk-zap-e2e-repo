region      = "us-east-1"
vpc_cidr        = "10.0.0.0/16"
s3_bucket_name  = "devsecops-artifact-bucket"
cluster_name    = "devsecops-eks-cluster"
cluster_version = "1.27"
project_prefix = "capstone"  


node_groups = {
  default = {
    desired_capacity = 2
    max_capacity     = 3
    min_capacity     = 1
    instance_types   = ["t3.micro"]
  }
}
