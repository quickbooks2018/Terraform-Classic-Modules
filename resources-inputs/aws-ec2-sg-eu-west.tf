module "cloudelligent-ec2-sg" {
  source = "./modules/ec2-sg"
  region = "eu-west-2"
  vpc-id = "${module.cloudelligent-vpc.vpc-id}"
  ec2-sg-name = "ec2-sg"



}