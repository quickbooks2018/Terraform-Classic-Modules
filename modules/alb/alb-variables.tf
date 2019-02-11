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





#TARGET GROUPS

variable "tg-name" {
  default = ""
}

variable "port" {
  default = ""
}

variable "protocol" {
  default = ""
}

variable "vpc-id" {
  default = ""
}

variable "frontend-attachment-1" {
  default = ""
}

variable "frontend-attachment-2" {
  default = ""
}

variable "certificate-arn" {
  default = ""
}