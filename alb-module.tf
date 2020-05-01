module "alb" {
  source = "./modules/alb"

  region = "us-east-1"
  alb-name = "infragurus-alb"
  internal = "false"
  alb-sg = "${module.infragurus-ec2-sg.ec2-sg-security-group}"
  alb-subnets = "${module.vpc.public-subnet-ids}"
  alb-tag = "infragurus-alb"
  certificate-arn = "arn:aws:acm:us-east-1:898668804275:certificate/fef70c69-2971-4456-9020-4e35d9f8f742"

  #Target Groups

  tg-name = "cloudellient-tg"
  port = "80"
  protocol = "HTTP"
  vpc-id = "${module.vpc.vpc-id}"
  no-of-frontend-attachments = "${module.ec2-app-v1.aws-instance}"
}