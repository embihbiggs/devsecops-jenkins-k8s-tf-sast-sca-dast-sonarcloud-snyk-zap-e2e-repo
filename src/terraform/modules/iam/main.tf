data "aws_iam_policy_document" "eks_assume" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "eks_control_plane" {
  name               = "eks-control-plane-role"
  assume_role_policy = data.aws_iam_policy_document.eks_assume.json
  tags = {
    Name = "eks-control-plane-role"
  }
}

resource "aws_iam_role" "eks_node_group" {
  name               = "eks-node-group-role"
  assume_role_policy = data.aws_iam_policy_document.eks_assume.json
  tags = {
    Name = "eks-node-group-role"
  }
}
