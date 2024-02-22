


data "aws_iam_policy_document" "eks_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "eks_role" {
  name               = "eks-cluster-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "example-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.example.name
}


output "aws_iam_role_arn" {
  value = data.aws_iam_policy_document.eks_role.arn
  
}

output "aws_node_role_arn" {
  value = aws_iam_role_policy_attachment.example-AmazonEKSClusterPolicy.arn
  
}