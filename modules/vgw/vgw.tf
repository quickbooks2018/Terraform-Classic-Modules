provider "aws" {
  region = "${var.region}"
}
resource "aws_vpn_gateway" "vgw" {
  vpc_id = "${var.vpc-id}"
  tags {
    Name = "${var.vpn-gateway-name}"
  }
}

#VPN# ROUTES PROPAGATIONS
############Route Propagations for Public Subnets###########
resource "aws_vpn_gateway_route_propagation" "vgw-public-routes" {
  count = "${length(data.aws_availability_zones.azs.names)}"
  vpn_gateway_id = "${aws_vpn_gateway.vgw.id}"
  route_table_id = "${element(var.vgw-public-route-table-id,count.index )}"

}

#######Route Propagations for Private Subnets############
resource "aws_vpn_gateway_route_propagation" "vgw-private-routes" {
  count = "${length(data.aws_availability_zones.azs.names)}"
  vpn_gateway_id = "${aws_vpn_gateway.vgw.id}"
  route_table_id = "${element(var.vgw-private-route-table-id,count.index)}"
}



