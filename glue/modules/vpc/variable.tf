variable "cidr_vpc" {}
variable "cidr_public" {}
variable "cidr_private" {}
variable "route_table_name" {}
variable "subnet_name" {}
variable "igw_name" {}

variable "availability_zones" {
  type    = list(string)
  default = ["ap-northeast-1a", "ap-northeast-1c"]
}