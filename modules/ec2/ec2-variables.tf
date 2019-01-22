variable "region" {
  default = ""
}
variable "key-name" {
  default = ""
}

variable "ami-id" {
  default = ""
}

variable "instance-type" {
  default = ""
}

variable "associate-public-ip-address" {
  default = ""
}

variable "subnet-id" {
  default = ""
}

variable "number-of-ec2-instances-required" {
  default = ""
}

variable "user-data" {
  default = ""
}

variable "instance-name-taq" {
  default = ""
}

variable "vpc-security-group-ids" {
  default = ""
}

variable "public-key-file-name" {
  default = ""
}

#EC2 VARIABLES
#EC2 Subnet ID's for Subnets
variable "ec2-subnets-ids" {
  type = "list"
  default = ["","",""]
}

#PROVISIONERS START
variable "source-file" {
  default = ""
}

variable "destination-file" {
  default = ""
}

variable "command-1" {
  default = ""
}

variable "command-2" {
  default = ""
}

#CONNECTION
variable "connection-type" {
  default = ""
}

variable "host-ip" {
  default = ""
}

variable "user-name" {
  default = ""
}

variable "private-key" {
  default = ""
}
#PROVISIONERS END