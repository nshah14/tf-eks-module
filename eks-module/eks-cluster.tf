resource "aws_eks_cluster" "eks" {
  name     = var.cluster-name
  role_arn = aws_iam_role.eks-cluster.arn

  vpc_config {
    security_group_ids = [aws_security_group.eks-cluster.id] 
    subnet_ids = var.subnet_ids
    # ["subnet-0a11d914ccd812ca4", "subnet-0ebd6c6e7cebe58b6"]

  }

  depends_on = [
    aws_iam_role_policy_attachment.eks-cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks-cluster-AmazonEKSServicePolicy,
  ]
}

