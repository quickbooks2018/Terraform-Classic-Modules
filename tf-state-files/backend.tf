provider "aws" {
  region = "eu-west-2"
}

terraform {
  backend "s3" {
    encrypt = "true"
    region = "eu-west-2"
    bucket = "terraform.cloudelligent.com"
    key = "Cloudelligent-Terraform-State-Files/cloudelligent-tf-state-files"
    dynamodb_table = "tflocktable"

  }
}