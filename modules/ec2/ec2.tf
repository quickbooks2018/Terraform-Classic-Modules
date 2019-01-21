provider "aws" {
  region = "${var.region}"
}

#CREATING A NEW KEY PAIR AND EXPORTING OUR PUBLIC-KEY
resource "aws_key_pair" "key-pair" {
  key_name = "${var.key-name}"
  public_key = "${var.public-key-file-name}"
}



#Creating an EC2 instance in Public Subnet must mention the "Subnet ID"#
resource "aws_instance" "ec2" {

  ami = "${var.ami-id}"

  instance_type = "${var.instance-type}"

# Number of EC2-instances required.
  count = "${var.number-of-ec2-instances-required}"

  #EXISTING KEY PAIR OR CREATE ssh-keygen -f demo #it will give private & public keys, import public in aws

 # Public IP Address
  associate_public_ip_address = "${var.associate-public-ip-address}"

# EXPORTED PUBLIC-KEY
  key_name = "${var.key-name}"

# BASH SCRIPT
  user_data = "${var.user-data}"

# MULTIPLE SUBNETS IDS
  subnet_id = "${element(var.ec2-subnets-ids,count.index)}"
  vpc_security_group_ids = ["${var.vpc-security-group-ids}"]
  tags {
    Name= "${var.instance-name-taq}-${count.index+1}"
  }
}
