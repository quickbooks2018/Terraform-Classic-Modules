#Creating S3 Bucket with versioning enable
provider "aws" {
  region = "${var.region}"
}

resource "aws_s3_bucket" "doosra-saqlainmushtaq-com" {

  bucket = "${var.bucket-name}"

  acl    = "${var.acl}"


  versioning {

    enabled = "${var.versioning-enable}"

  }



  lifecycle {

    prevent_destroy = true

  }



  tags {

    Name = "${var.tag}"

  }

}