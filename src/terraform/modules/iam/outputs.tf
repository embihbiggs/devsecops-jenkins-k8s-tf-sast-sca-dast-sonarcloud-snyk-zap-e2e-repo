output "eks_control_plane_role_arn" {
  value = aws_iam_role.eks_control_plane.arn
}

output "eks_node_group_role_arn" {
  value = aws_iam_role.eks_node_group.arn
}
