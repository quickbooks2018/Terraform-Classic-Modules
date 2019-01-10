module "ec2-app-v1-1" {
  source = "./modules/ec2-app-v1-1"

  region = "eu-west-1"
  key-name = "power"
  public-key-file-name = "${file("./modules/ec2-app-v1/power.pub")}"
  subnet-id = "subnet-0332bf33e64920430"
  private-ip = "172.40.12.6"
  ami-id = "ami-08935252a36e25f85"
  instance-type = "t2.micro"
  user-data = "${file("./modules/ec2-app-v1-1/httpd.sh")}"
  vpc-security-group-ids = "${module.cloudelligent-ec2-sg.ec2-sg-security-group}"
  instance-name-tag = "Cloudelligent-demo"

}