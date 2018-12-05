provider "aws" {
  region = "${var.region}"
}


resource "aws_customer_gateway" "customer_gateway" {
  bgp_asn    = 65000
  ip_address = "${var.customer-gateway-ip-address}"
  type       = "ipsec.1"
  tags {
    Name = "${var.customer-gateway-name}"
  }
}



resource "aws_vpn_connection" "vpn" {
  vpn_gateway_id      = "${var.vpn-gateway-id}"
  customer_gateway_id = "${aws_customer_gateway.customer_gateway.id}"
  type                = "ipsec.1"
  static_routes_only  = true
  tags {
    Name = "${var.vpn-connection-name}"
  }
}

resource "aws_vpn_connection_route" "office" {
  destination_cidr_block = "${var.data-center-private-cidr}"
  vpn_connection_id      = "${aws_vpn_connection.vpn.id}"
}
