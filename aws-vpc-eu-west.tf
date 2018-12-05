module "cloudelligent-vpc" {
  source = "./modules/vpc"
  ###VPC###
  instance-tenancy = "default"
  enable-dns-support = "true"
  vpc-name = "Cloudelligent-vpc"
  vpc-location = "London"
  region = "eu-west-2"
  internet-gateway-name = "Cloudelligent-IGW"
  map_public_ip_on_launch = "true"
  public-subnets-name = "public-subnets"
  public-subnets-location = "London"
  public-subnet-routes-name = "public-subnet-routes"
  private-subnets-location-name = "London"
  total-nat-gateway-required = "3"
  eip-for-nat-gateway-name = "eip-nat-gateway"
  nat-gateway-name = "nat-gateway-name"
  eip-required = "3"
  private-route-cidr = "0.0.0.0/0"
  private-route-name = "private-route"
  vpc-cidr = "192.168.0.0/16"
  vpc-public-subnet-cidr = ["192.168.1.0/24","192.168.2.0/24","192.168.3.0/24"]
  vpc-private-subnet-cidr = ["192.168.4.0/24","192.168.5.0/24","192.168.6.0/24"]
  number-of-public-subnets-required = "3"
  number-of-private-subnets-required = "3"

#NOTE:PLEASE UN-COMMENT "vgw-id" IN CASE OF VPN ROUTE PROPAGATION#
  vgw-id = "${module.cloudelligent-vgw.vgw}"


}
