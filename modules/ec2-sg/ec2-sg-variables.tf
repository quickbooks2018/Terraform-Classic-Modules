variable "region" {
  default = ""
}

variable "vpc-id" {
  default = ""
}

variable "ec2-sg-name" {
  default = ""
}

#SG INBOUND RULES#
#RULE 1
variable "rule-1-from-port" {
  default = ""
}
variable "rule-1-protocol" {
  default = ""
}
variable "rule-1-to-port" {
  default = ""
}
variable "rule-1-cidr_blocks" {
  default = ""
}
#RULE 2
variable "rule-2-from-port" {
  default = ""
}
variable "rule-2-protocol" {
  default = ""
}
variable "rule-2-to-port" {
  default = ""
}
variable "rule-2-cidr_blocks" {
  default = ""
}
#RULE 3
variable "rule-3-from-port" {
  default = ""
}
variable "rule-3-protocol" {
  default = ""
}
variable "rule-3-to-port" {
  default = ""
}
variable "rule-3-cidr_blocks" {
  default = ""
}
#RULE 4
variable "rule-4-from-port" {
  default = ""
}
variable "rule-4-protocol" {
  default = ""
}
variable "rule-4-to-port" {
  default = ""
}
variable "rule-4-cidr_blocks" {
  default = ""
}
#RULE 5
variable "rule-5-from-port" {
  default = ""
}
variable "rule-5-protocol" {
  default = ""
}
variable "rule-5-to-port" {
  default = ""
}
variable "rule-5-cidr_blocks" {
  default = ""
}

#SG OUTBOUND RULES#
variable "outbound-rule-1-from-port" {
  default = ""
}
variable "outbound-rule-1-protocol" {
  default = ""
}
variable "outbound-rule-1-to-port" {
  default = ""
}
variable "outbound-rule-1-cidr_blocks" {
  default = ""
}