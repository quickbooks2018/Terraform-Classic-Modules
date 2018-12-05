module "cloudelligent-vpn" {
  source = "./modules/vpn"
  region = "eu-west-2"
  aws-customer-gateway-static-public-ip = "18.212.155.123"
  customer-gateway-name = "office"
  aws-vgw-name = "VGW"
  vpn-connection-name = "office-vpn-connection"
  vpc-id = "${module.cloudelligent-vpc.vpc-id}"

  vpn-gateway-id = "${module.cloudelligent-vpc.vgw}"



  customer-gateway-ip-address = "3.121.242.236"

  vpn-gateway-name = "AWS-VGW-London-Cloudelligent"
  data-center-private-cidr = "10.11.0.0/16"
  aws-availability-zones = "${module.cloudelligent-vpc.aws-availability-zones}"

}

#NOTE:IF VPN IS REQUIRED UNCOMMENT THE VPN SECTION IN (vpc.tf file) IN VPC DIRECTORY FOR VGW CREATION & ROUTE PROPAGATION + USE THE VPN MODULE

