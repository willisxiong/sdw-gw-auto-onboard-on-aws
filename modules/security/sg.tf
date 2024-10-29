resource "aws_security_group" "internet_sg" {
  name   = "internet_access_sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tpc"
    cidr_blocks = ["223.119.0.0/16"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["18.163.189.237/32"]
  }

  ingress {
    from_port   = 123446
    to_port     = 13046
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "internet-sg"
  }
}

resource "aws_security_group" "mpls_sg" {
  name   = "mpls_access_sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tpc"
    cidr_blocks = ["172.16.0.0/16"]
  }

  tags = {
    Name = "mpls-sg"
  }
}

resource "aws_security_group" "lan_sg" {
  count = var.lan_sg_enable == true ? 1 : 0

  name   = "lan_access_sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "lan-sg"
  }
}