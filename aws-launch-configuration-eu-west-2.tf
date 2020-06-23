module "launch-configuration-ec2-app" {
  source = "./modules/launch-configuration-ec2-app"
  launch-configuration-region = "eu-west-2"
  launch-configuration-name = "launch-configuration-ec2-app"
  launch-configuration-ami-id = "ami-0274e11dced17bb5b"
  launch-configuration-security-groups = "${module.cloudgeeks-ec2-sg.ec2-sg-security-group}"
  launch-configuration-instance-type = "t2.micro"
  launch-configuration-public-key-name = "power"
  launch-configuration-root-block-device-volume-type = "gp2"
  launch-configuration-root-block-volume-size = "30"

}