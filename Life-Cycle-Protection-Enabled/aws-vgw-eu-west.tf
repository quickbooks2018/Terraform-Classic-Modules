module "cloudelligent-vgw" {
  source = "./modules/vgw"
  region = "eu-west-2"
  vpc-id = "${module.cloudelligent-vpc.vpc-id}"
  vpn-gateway-name = "Cloudelligent-vgw"
}