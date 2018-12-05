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