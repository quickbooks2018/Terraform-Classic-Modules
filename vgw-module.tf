module "vgw" {
  source = "./modules/vgw"
  region = "us-east-2"
  vpc-id = "${module.vpc.vpc-id}"
  vpn-gateway-name = "Cloudelligent-vgw"
  vgw-public-route-table-id = "${module.vpc.aws-route-table-public-routes-id}"
  vgw-private-route-table-id = "${module.vpc.aws-route-table-private-routes-id}"
}