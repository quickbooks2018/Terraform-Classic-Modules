provider "aws" {
  region = "eu-west-2"
}

resource "aws_dynamodb_table" "tflocktable" {

  name = "tflocktable"

  hash_key = "LockID"

  read_capacity = 5

  write_capacity = 5

  attribute {

    name = "LockID"

    type = "S"

  }

}