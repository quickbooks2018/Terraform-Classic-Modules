provider "aws" {
  region = "${var.region}"
}


resource "aws_security_group" "rds-sg" {
  name = "${var.aws-security-group-name}"
  vpc_id = "${var.vpc-id}"

  tags {
    Name = "${var.aws-security-group-tag-name}"
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

  egress {
    from_port = "${var.outbound-rule-1-from-port}"
    protocol = "${var.outbound-rule-1-protocol}"
    to_port = "${var.outbound-rule-1-to-port}"
    cidr_blocks = ["${var.outbound-rule-1-cidr_blocks}"]
  }



}
