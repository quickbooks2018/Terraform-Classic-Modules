provider "aws" {
  region = "eu-west-2"
}

#Note this DynamoDB Table must be in the same region as your S3 bucket is setup for backend#

resource "aws_dynamodb_table" "tflocktable" {

  name = "terraformstatelocktable"

  hash_key = "LockID"

  read_capacity = 1

  write_capacity = 1

  attribute {

    name = "LockID"

    type = "S"

  }

}
