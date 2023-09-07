resource "aws_rds_cluster" "cluster" {
  cluster_identifier  = var.rds_name
  engine              = "aurora-mysql"
  engine_version      = "5.7.mysql_aurora.2.03.2"
  availability_zones  = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
  master_username     = "admin"
  master_password     = var.master_password
  deletion_protection = true
  vpc_security_group_ids = [
    aws_security_group.rds.id
  ]
}

resource "aws_rds_cluster_instance" "instance" {
  count              = 1
  identifier         = var.rds_name
  cluster_identifier = aws_rds_cluster.cluster.id
  instance_class     = "db.t3.small"
  engine             = aurora-mysql
  engine_version     = "5.7.mysql_aurora.2.03.2"
}

resource "aws_security_group" "rds" {
  description = var.security_group_rds
  vpc_id      = var.vpc_id
  name        = var.security_group_rds
  tags = {
    Name = var.security_group_rds
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
  }

  ingress {
    cidr_blocks      = ["0.0.0.0/0"]
    from_port        = "3306"
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = "3306"
  }
}