output "vpc_id" {
  value = module.vpc.vpc_id
}

output "eks_cluster_name" {
  value = module.eks_cluster.cluster_name
}

output "artifact_bucket" {
  value = module.s3_kms.artifact_bucket_name
}


output "bucket_name" {
  value = module.s3_kms.artifact_bucket_name
}
