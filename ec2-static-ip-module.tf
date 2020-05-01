module "ec2-static-ip" {
  source = "modules/ec2-static-ip"

  region = "eu-west-1"
  key-name = "power"
  subnet-id = "subnet-0332bf33e64920430"
  private-ip = "172.40.12.6"
  ami-id = "ami-08935252a36e25f85"
  instance-type = "t2.micro"
  user-data = "${file("./modules/ec2-app-v1-1/httpd.sh")}"
  vpc-security-group-ids = ""
  instance-name-tag = "infragurus-demo-prod"

}