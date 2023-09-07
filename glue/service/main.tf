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
  subnet_name = "${var.project}-subnet"
  igw_name = "${var.project}-igw"


}