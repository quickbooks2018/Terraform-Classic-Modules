variable "region" {
  default = ""
}

variable "vpc-id" {
  default = ""
}

variable "vpn-gateway-name" {
  default = ""
}

variable "vgw-public-route-table-id" {
  type = "list"

}


variable "vgw-private-route-table-id" {
  type = "list"
}

data "aws_availability_zones" "azs" {}