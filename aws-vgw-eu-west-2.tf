module "cloudelligent-vgw" {
  source = "./modules/vgw"
  region = "eu-west-2"
  vpc-id = "${module.cloudelligent-vpc.vpc-id}"
  vpn-gateway-name = "Cloudelligent-vgw"
  vgw-public-route-table-id = "${module.cloudelligent-vpc.aws-route-table-public-routes-id}"
  vgw-private-route-table-id = "${module.cloudelligent-vpc.aws-route-table-private-routes-id}"
}