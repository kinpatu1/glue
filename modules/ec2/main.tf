resource "aws_instance" "gateway" {
  subnet_id                   = module.vpc.project_vpc_id
  ami                         = "ami-07d6bd9a28134d3b3"
  associate_public_ip_address = true
  availability_zone           = "ap-northeast-1a"
  ebs_optimized               = true
  instance_type               = "t2.micro"
  key_name                    = var.key_name

  root_block_device {
    volume_type = "gp2"
    volume_size = 60
    tags = {
      Name = "${var.project}-ebs"
    }
  }

  credit_specification {
    cpu_credits = "standard"
  }

  vpc_security_group_ids = [
    aws_security_group.gateway.id
  ]

  tags = {
    Name = "${var.project}-gateway"
  }
}

resource "aws_security_group" "gateway" {
  description = "${var.security_group}-sg-gateway"
  vpc_id      = module.vpc.project_vpc_id
  name        = "${var.security_group}-sg-gateway"
  tags = {
    Name = "${var.security_group}-sg-gateway"
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
    from_port        = "22"
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = "22"
  }
}
