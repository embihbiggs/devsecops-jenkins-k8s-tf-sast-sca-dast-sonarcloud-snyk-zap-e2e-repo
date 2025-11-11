module "eks_cluster" {
source = "terraform-aws-modules/eks/aws"
version = ">= 19.0.0"


cluster_name = "${var.project_prefix}-eks"
cluster_version = "1.28"


vpc_id = var.vpc_id
subnet_ids = concat(var.public_subnet_ids, var.private_subnet_ids)


manage_aws_auth = true


node_groups = {
default = {
desired_capacity = var.eks_node_desired_capacity
max_capacity = var.eks_node_desired_capacity + 1
min_capacity = 1
instance_types = [var.eks_node_instance_type]
}
}


tags = {
Project = var.project_prefix
Terraform = "true"
}
}


resource "local_file" "kubeconfig" {
content = module.eks_cluster.kubeconfig
filename = "${path.module}/kubeconfig_${module.eks_cluster.cluster_id}"
depends_on = [module.eks_cluster]
}