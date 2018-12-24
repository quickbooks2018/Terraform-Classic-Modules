module "vpn" {
  source = "./modules/vpn"

  region = "us-east-2"

  customer-gateway-static-public-ip = "18.194.223.182"

  customer-gateway-name = "Frankfurt-office"

  vpn-connection-name = "Frankfurt-office-vpn-connection"

  vpc-id = "${module.vpc.vpc-id}"

  vpn-gateway-id = "${module.vgw.vgw}"

  data-center-private-cidr = "10.11.0.0/16"

}
