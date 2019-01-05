module "ec2-app-v1" {
  source = "./modules/ec2"
  region = "eu-west-1"
  key-name = "power"
  ami-id = "ami-08935252a36e25f85"
  instance-type = "t2.micro"
 # subnet-id =
  number-of-ec2-instances-required = "3"
  public-key-file-name = "${file("./modules/ec2/power.pub")}"
  user-data = "${file("./modules/ec2/httpd.sh")}"
  instance-name-taq = "cloudelligent-vpn"
 vpc-security-group-ids = "${module.cloudelligent-ec2-sg.ec2-sg-security-group}"

  ec2-subnets-ids = ["${module.vpc.public-subnet-ids}"]
  #ec2-subnets-ids = ["${module.cloudelligent-vpc.private-subnet-ids}"]
  #IN CASE OF LAUNCHING EC2 IN SPECIFIC SUBNET USE"
  #ec2-subnets-ids = ["","","","","",""]


}