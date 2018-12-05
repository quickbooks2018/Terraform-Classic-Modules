provider "aws" {
  region = "${var.region}"
}

resource "aws_security_group" "ec2-sg" {
  name = "${var.ec2-sg-name}"
  vpc_id = "${var.vpc-id}"

  tags {
    Name = "${var.ec2-sg-name}"
  }

  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 443
    protocol = "tcp"
    to_port = 443
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["39.46.252.153/32"]
  }

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

