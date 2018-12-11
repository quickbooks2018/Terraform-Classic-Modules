provider "aws" {
  region = "${var.region}"
}
resource "aws_vpn_gateway" "vgw" {
  vpc_id = "${var.vpc-id}"


  lifecycle {
    create_before_destroy = "true"
    prevent_destroy = "true"
  }

  tags {
    Name = "${var.vpn-gateway-name}"
  }
}



