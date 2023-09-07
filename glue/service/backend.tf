terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.44.0"
    }
  }
 
  required_version = "~> 1.2.5"
}
 
provider "aws" {
  region     = "ap-northeast-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}