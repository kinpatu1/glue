resource "aws_security_group" "glue" {
  description = var.security_group_glue
  vpc_id      = var.vpc_id
  name        = var.security_group_glue
  tags = {
    Name = var.security_group_glue
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
    cidr_blocks      = []
    from_port        = "0"
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = true
    to_port          = "65535"
  }
}

resource "aws_glue_catalog_database" "glue_database" {
  name = var.glue_database_name
}

resource "aws_glue_connection" "glue_connection_name" {
  connection_properties = {
    JDBC_CONNECTION_URL = "jdbc:mysql://${var.instance_endpoint}:3306/${var.database}"
    PASSWORD            = var.password
    USERNAME            = var.username
    JDBC_ENFORCE_SSL    = true
  }

  physical_connection_requirements {
    availability_zone      = "ap-northeast-1c"
    security_group_id_list = ["${aws_security_group.glue.id}"]
    subnet_id              = var.subnet_id_for_glue
  }

  name = var.glue_connection_name
}