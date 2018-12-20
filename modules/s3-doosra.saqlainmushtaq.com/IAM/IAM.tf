provider "aws" {
  region = "${var.region}"
}

resource "aws_iam_user" "user" {
  name = "${var.user-name}"

  tags = {
    Name = "${var.iam-user-tag}"
  }
}

resource "aws_iam_access_key" "user" {
  user = "${aws_iam_user.user.name}"
  
}



resource "aws_iam_user_policy" "user" {
  name = "${var.iam-user-policy}"
  user = "${aws_iam_user.user.name}"
  policy = "${var.bucket-policy}"

}