variable "region" {
  default = "ap-south-1"
}

variable "aws_iam_role_arn" {
  default = "arn:aws:iam::344118038900:role/my-Eksrole"
}

variable "subnet_ids" {
  default = ["subnet-00176d90cad22ee1a","subnet-046008e21d6b01a4c","subnet-0e82cc092ba027788"]
}

variable "aws_node_role_arn" {
    default = "arn:aws:iam::344118038900:role/eksnodepolicy"
}

