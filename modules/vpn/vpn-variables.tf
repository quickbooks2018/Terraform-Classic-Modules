###VPN###
#OFFICE STATIS PUBLIC IP
variable "aws-customer-gateway-static-public-ip" {
  default = ""
}
#CUSTOMER GATEWAY PUBLIC STATIC ADDRESS
variable "customer-gateway-ip-address" {
  default = ""
}


#CUSTOMER GATE-WAY NAME
variable "customer-gateway-name" {
  default = ""
}

#DATA-CENTER/OFFICE PRIVATE CIDR
variable "data-center-private-cidr" {
  default = ""
}


variable "vpn-gateway-name" {
  default = ""
}

variable "vpn-connection-name" {
  default = "AWS-VGW-Viginia-vpn-link-DATA-Center-Frankfurt"
}

variable "vpc-id" {
  default = ""
}

variable "aws-availability-zones" {
  default = ""
}

variable "region" {
  default = ""
}

variable "vpn-gateway-id"
{
  default = ""
}

data "aws_availability_zones" "azs" {}