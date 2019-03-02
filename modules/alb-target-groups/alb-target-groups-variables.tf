#Application Load Balancer Target Group
variable "region" {
  default = ""
}

variable "alb-tg-name" {
  default = ""
}
variable "target-group-port" {
  default = ""
}

variable "target-group-protocol" {
  default = ""
}

variable "vpc-id" {
  default = ""
}