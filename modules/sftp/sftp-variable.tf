#SFTP Variables
variable "region" {
  default = ""
}
variable "aws-transfer-server-name" {
  default = ""
}

variable "IAM-role-name-for-sftp" {
  default = ""
}

variable "s3-access-policy-name" {
  default = ""
}

variable "s3-policy-file-location" {
  default = ""
}

variable "sftp-user-name" {
  default = ""
}

variable "sftp-s3-bucket-name" {
  default = ""
}

variable "ssh-public-key-file-location" {
  default = ""
}
