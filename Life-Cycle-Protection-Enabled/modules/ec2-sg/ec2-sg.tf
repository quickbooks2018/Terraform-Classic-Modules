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
    from_port = "${var.rule-1-from-port}"
    protocol = "${var.rule-1-protocol}"
    to_port = "${var.rule-1-to-port}"
    cidr_blocks = ["${var.rule-1-cidr_blocks}"]
  }
  ingress {
    from_port = "${var.rule-2-from-port}"
    protocol = "${var.rule-2-protocol}"
    to_port = "${var.rule-2-to-port}"
    cidr_blocks = ["${var.rule-2-cidr_blocks}"]
  }

 ingress {
    from_port = "${var.rule-3-from-port}"
    protocol = "${var.rule-3-protocol}"
    to_port = "${var.rule-3-to-port}"
    cidr_blocks = ["${var.rule-3-cidr_blocks}"]
  }


  ingress {
    from_port = "${var.rule-4-from-port}"
    protocol = "${var.rule-4-protocol}"
    to_port = "${var.rule-4-to-port}"
    cidr_blocks = ["${var.rule-4-cidr_blocks}"]
  }
  ingress {
    from_port = "${var.rule-5-from-port}"
    protocol = "${var.rule-5-protocol}"
    to_port = "${var.rule-5-to-port}"
    cidr_blocks = ["${var.rule-5-cidr_blocks}"]
  }

  egress {
    from_port = "${var.outbound-rule-1-from-port}"
    protocol = "${var.outbound-rule-1-protocol}"
    to_port = "${var.outbound-rule-1-to-port}"
    cidr_blocks = ["${var.outbound-rule-1-cidr_blocks}"]
  }



}

