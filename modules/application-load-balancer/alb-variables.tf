#ALB VARIABLES

variable "region" {
  default = ""
}

variable "alb-name" {
  default = ""
}

variable "internal" {
  default = ""
}

variable "alb-sg" {
  default = ""
}

variable "alb-subnets" {
  type = "list"
}

variable "alb-tag" {
  default = ""
}

variable "target-group-arn" {
  default = ""
}

variable "certificate-arn" {
  default = ""
}