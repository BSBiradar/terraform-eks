provider "aws" {
    region = var.region
  
}

resource "aws_eks_cluster" "cbz_eks" {
  name     = "cbz-cluster"
  role_arn = var.aws_iam_role_arn
  version = "1.29"



  vpc_config {
    subnet_ids = var.subnet_ids
  }

}

resource "aws_eks_node_group" "node" {
  cluster_name    = "cbz-cluster"
  node_group_name = "cbz-node"
  node_role_arn   = var.aws_node_role_arn
  subnet_ids      = var.subnet_ids
  ami_type = var.ami
  instance_types = ["t3.medium","t3.large"]
  disk_size = "20"

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

  update_config {
    max_unavailable = 1
  }


}