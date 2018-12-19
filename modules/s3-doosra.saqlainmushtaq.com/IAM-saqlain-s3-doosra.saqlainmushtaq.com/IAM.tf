provider "aws" {
  region = "${var.region}"
}

resource "aws_iam_user" "saqlain" {
  name = "${var.user-name}"

  tags = {
    Name = "${var.iam-user-tag}"
  }
}

resource "aws_iam_access_key" "saqlain" {
  user = "${aws_iam_user.saqlain.name}"
}

resource "aws_iam_user_policy" "saqlain" {
  name = "${var.iam-user-policy}"
  user = "${aws_iam_user.saqlain.name}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": ["s3:ListBucket"],
            "Resource": ["arn:aws:s3:::doosra.saqlainmushtaq.com"]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject"
            ],
            "Resource": ["arn:aws:s3:::doosra.saqlainmushtaq.com/*"]
        }
    ]
}
EOF
}