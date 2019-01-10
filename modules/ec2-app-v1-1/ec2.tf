provider "aws" {
  region = "${var.region}"
}


#CREATING A NEW KEY PAIR AND EXPORTING OUR PUBLIC-KEY
resource "aws_key_pair" "key-pair" {
  key_name = "${var.key-name}"
  public_key = "${var.public-key-file-name}"
}


resource "aws_instance" "ec2" {
  ami = "${var.ami-id}"
  instance_type = "${var.instance-type}"
  private_ip = "${var.private-ip}"
  user_data = "${var.user-data}"
  subnet_id = "${var.subnet-id}"
  key_name = "${var.key-name}"
  vpc_security_group_ids = ["${var.vpc-security-group-ids}"]
  tags {
    Name= "${var.instance-name-tag}-${count.index+1}"
  }


}