provider "aws" {
  region = "${var.region}"
}

resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc-cidr}"
  instance_tenancy = "${var.instance-tenancy}"
  enable_dns_support = "${var.enable-dns-support}"
  tags {
    Name= "${var.vpc-name}"
    Location= "${var.vpc-location}"
  }

  lifecycle {
    create_before_destroy = "true"
    prevent_destroy = "true"
  }


}

#CREATING A INTERNET GATEWAY

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name= "${var.internet-gateway-name}"

  }
}

#PUBLIC SUBNET FROM A LIST
resource "aws_subnet" "public-subnets" {
  availability_zone = "${element(data.aws_availability_zones.azs.names,count.index)}"
  count = "${var.number-of-public-subnets-required}"
  # count = "${length(data.aws_availability_zones.azs.names)}"
  cidr_block = "${element(var.vpc-public-subnet-cidr,count.index)}"
  vpc_id = "${aws_vpc.vpc.id}"
  map_public_ip_on_launch = "${var.map_public_ip_on_launch}"

  tags {
    Name = "${var.public-subnets-name}-${count.index+1}"
    Location = "${var.public-subnets-location}"
  }
}

#CREATING A PUBLIC ROUTES
resource "aws_route_table" "public-routes" {
  vpc_id = "${aws_vpc.vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
  tags {
    Name = "${var.public-subnet-routes-name}"
  }
}

#ASSOCIATE/LINK PUBLIC-ROUTE WITH PUBLIC-SUBNETS LIST
# https://github.com/hashicorp/terraform/issues/14880
resource "aws_route_table_association" "public-association" {
  count = "${length(data.aws_availability_zones.azs.names)}"
  route_table_id = "${aws_route_table.public-routes.id}"
  subnet_id = "${element(aws_subnet.public-subnets.*.id, count.index)}"
}

#CREATING PRIVATE SUBNETS FROM A LIST
resource "aws_subnet" "private-subnets" {
  availability_zone = "${element(data.aws_availability_zones.azs.names,count.index)}"
  count = "${var.number-of-private-subnets-required}"
  # count = "${length(data.aws_availability_zones.azs.names)}"
  cidr_block = "${element(var.vpc-private-subnet-cidr,count.index)}"
  vpc_id = "${aws_vpc.vpc.id}"


  tags {
    Name = "Private-Subnet-${count.index+1}"
    Location = "${var.private-subnets-location-name}"
  }
}

#CREATING 3 EIP NAT-GATEWAY FOR NAT-GATEWAY REDUNDANCY
resource "aws_eip" "eip-ngw" {
  # count = "${length(var.azs)}"
  count = "${var.eip-required}"
  tags {
    Name = "${var.eip-for-nat-gateway-name}-${count.index+1}"
  }
}
#CREATING 3 NAT GATEWAYS IN PUBLIC-SUBNETS, EACH NAT-GATEWAY WILL BE DIFFERENT AZ FOR REDUNDANCY.
resource "aws_nat_gateway" "ngw" {
  count = "${var.total-nat-gateway-required}"
  # count = "${length(var.azs)}"
  allocation_id = "${element(aws_eip.eip-ngw.*.id,count.index)}"
  subnet_id = "${element(aws_subnet.public-subnets.*.id, count.index)}"
  tags {
    Name = "${var.nat-gateway-name}-${count.index+1}"
  }
}

#CREATING A PRIAVTE ROUTE-TABLE FOR PRIVATE-SUBNETS
resource "aws_route_table" "private-routes" {
  count = "${length(data.aws_availability_zones.azs.names)}"
  vpc_id = "${aws_vpc.vpc.id}"
  route {
    cidr_block = "${var.private-route-cidr}"
    nat_gateway_id = "${element(aws_nat_gateway.ngw.*.id,count.index)}"
  }
  tags {
    Name = "${var.private-route-name}-${count.index+1}"
  }

}

#ASSOCIATE/LINK PRIVATE-ROUTES WITH PRIVATE-SUBNETS
resource "aws_route_table_association" "private-routes-linking" {
  count = "${length(data.aws_availability_zones.azs.names)}"
  route_table_id = "${element(aws_route_table.private-routes.*.id,count.index)}"
  subnet_id = "${element(aws_subnet.private-subnets.*.id,count.index)}"
}


#VPN# ROUTES PROPAGATIONS
############Route Propagations for Public Subnets###########
resource "aws_vpn_gateway_route_propagation" "vpn-public-subnets" {
  vpn_gateway_id = "${var.vgw-id}"
  route_table_id = "${aws_route_table.public-routes.id}"

}

#######Route Propagations for Private Subnets############
resource "aws_vpn_gateway_route_propagation" "vpn-private-subnets" {
  count = "${length(data.aws_availability_zones.azs.names)}"
vpn_gateway_id = "${var.vgw-id}"
route_table_id = "${element(aws_route_table.private-routes.*.id,count.index)}"
}