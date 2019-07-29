###VPN###
#OFFICE STATIC PUBLIC IP
variable "customer-gateway-static-public-ip" {
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

variable "vpn-connection-name" {
  default = ""
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
