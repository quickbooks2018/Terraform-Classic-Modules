provider "aws" {
  region = "${var.region}"
}
resource "aws_vpn_gateway" "vgw" {
  vpc_id = "${var.vpc-id}"
  tags {
    Name = "${var.vpn-gateway-name}"
  }
}



