module "vpc" {
  ### Module Path
  source = "../modules/vpc"


  cidr_vpc = "10.0.0.0/16"
  cidr_public = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
  cidr_private = [
    "10.0.10.0/24",
    "10.0.20.0/24"
  ]
  route_table_name = "${var.project}-rtb"
  subnet_name      = "${var.project}-subnet"
  igw_name         = "${var.project}-igw"
  vpc_name         = "${var.project}-vpc"
  s3endpoint_name  = "${var.project}-s3endpoint"
}

module "ec2" {
  ### Module Path
  source = "../modules/ec2"

  key_name       = "miki"
  ebs_name       = "${var.project}-ebs"
  ec2_name       = "${var.project}-ec2"
  security_group = "${var.project}-security_group"

}