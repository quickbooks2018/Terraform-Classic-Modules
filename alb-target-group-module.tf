module "alb-target-group" {
  source = "./modules/alb-target-groups"

  region = "eu-west-1"
  #Application Load Balancer Target Group
  alb-tg-name = "cloudgeeks-tg"
  target-group-port = "80"
  target-group-protocol = "HTTP"
  vpc-id = "${module.vpc.vpc-id}"
}