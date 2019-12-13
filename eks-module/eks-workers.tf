
locals {
  worker-node-userdata = <<USERDATA
#!/bin/bash
set -o xtrace
/etc/eks/bootstrap.sh --apiserver-endpoint '${aws_eks_cluster.eks.endpoint}' --b64-cluster-ca '${aws_eks_cluster.eks.certificate_authority[0].data}' '${var.cluster-name}'
USERDATA

}

resource "aws_launch_configuration" "worker" {
  associate_public_ip_address = true
  iam_instance_profile = aws_iam_instance_profile.worker-node.name
  image_id = var.image_id
  # "ami-0199284372364b02a"

  instance_type = var.instance_type
  # "t2.large"
  name_prefix = var.name_prefix
  # "terraform-eks-worker"
  security_groups = [aws_security_group.worker-node.id]
  user_data_base64 = base64encode(local.worker-node-userdata)

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "worker" {
  desired_capacity = var.desired_capacity
  # 2
  launch_configuration = aws_launch_configuration.worker.id
  max_size = var.max_size
  # 2
  min_size = var.min_size
  # 1
  name = "terraform-eks-worker"
  vpc_zone_identifier = var.subnet_ids
  #¢module.vpc.public_subnets

  tag {
    key = "Name"
    value = var.cluster-name
    propagate_at_launch = true
  }

  tag {
    key = "kubernetes.io/cluster/${var.cluster-name}"
    value = "owned"
    propagate_at_launch = true
  }
}

