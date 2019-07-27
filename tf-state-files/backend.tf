provider "aws" {
  region = "eu-west-2"
}

terraform {
  backend "s3" {
    encrypt = "true"
    region = "eu-west-2"
    bucket = "terraform.cloudelligent.com"
    key = "cloudelligent/dev/terraform.tfstate"
    dynamodb_table = "terraformstatelocktable"

  }
}
