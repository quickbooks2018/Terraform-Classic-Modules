provider "aws" {
  region = "${var.launch-configuration-region}"
}


resource "aws_launch_configuration" "launch-configuration-ec2-app" {
  name          = "${var.launch-configuration-name}"
  image_id      = "${var.launch-configuration-ami-id}"
  instance_type = "${var.launch-configuration-instance-type}"
  security_groups = ["${var.launch-configuration-security-groups}"]
  key_name = "${var.launch-configuration-public-key-name}" #Public keyname already attached in AWS Console
  root_block_device {
    volume_type = "${var.launch-configuration-root-block-device-volume-type}"
    volume_size = "${var.launch-configuration-root-block-volume-size}"
  }

}
