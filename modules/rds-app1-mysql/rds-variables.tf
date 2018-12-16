#RDS VARIABLES
variable "region" {
  default = ""
}

variable "identifier" {
  default = ""
}
variable "final-snapshot-identifier" {
  default = ""
}

variable "rds-allocated-storage" {
  default = ""
}

variable "storage-type" {
  default = ""
}

variable "rds-engine" {
  default = ""
}

variable "engine-version" {
  default = ""
}

variable "db-instance-class" {
  default = ""
}

#These are automated backups
variable "backup-retension-period" {
  default = ""
}

variable "backup-window" {
  default = ""
}

variable "publicly-accessible" {
  default = ""
}

variable "rds-username" {
  default = ""
}

variable "rds-password" {
  default = ""
}

variable "skip-final-snapshot" {
  default = ""
}

variable "multi-az" {
  default = ""
}




#NOTE: PLEASE ONLY PUT THE PRIVATE-SUBNET IDS

variable "rds-private-subnets-groups-name" {
  default = ""
}

variable "rds-private-subnets-groups-description" {
  default = ""
}

variable "aws-db-subnet-group-private-subnets" {
  type = "list"
}

variable "vpc-security-group-ids" {
  default = ""
}

variable "storage-encrypted" {
  default = ""
}

variable "deletion-protection" {
  default = ""
}

#TAG
variable "name-aws-db-subnet-group" {
  default = ""
}



