module "cloudelligent-vpn" {
  source = "./modules/vpn"

  region = "eu-west-2"

  aws-customer-gateway-static-public-ip = "18.212.155.123"

  customer-gateway-name = "Frankfurt-office"

  vpn-connection-name = "Frankfurt-office-vpn-connection"

  vpc-id = "${module.cloudelligent-vpc.vpc-id}"

  vpn-gateway-id = "${module.cloudelligent-vgw.vgw}"

  customer-gateway-ip-address = "3.121.242.236"

  data-center-private-cidr = "10.11.0.0/16"

}
