#https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html
provider "aws" {
  region = "us-east-1"
}


resource "aws_iam_access_key" "Saqlain-Mushtaq" {
  user    = "${aws_iam_user.Saqlain-Mushtaq.name}"
  pgp_key = "keybase:quickbooks2018"
}

resource "aws_iam_user" "Saqlain-Mushtaq" {
  name = "Saqlain-Mushtaq"
  path = "/system/"
}

resource "aws_iam_user_policy" "Saqlain-Mushtaq-rw" {
  name = "test"
  user = "${aws_iam_user.Saqlain-Mushtaq.name}"

  policy = <<EOF
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Sid":"AddPerm",
      "Effect":"Allow",
      "Principal": "*",
      "Action": [
        "s3:GetObject",
        "s3:PutObject"
      ],
      "Resource":["arn:aws:s3:::examplebucket/*"]
    }
  ]
}
EOF
}

output "acces-key" {
  value = "${aws_iam_access_key.Saqlain-Mushtaq.id}"
}
output "secret" {
  value = "${aws_iam_access_key.Saqlain-Mushtaq.encrypted_secret}"
}
