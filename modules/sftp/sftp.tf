provider "aws" {
  region = "${var.region}"
}
resource "aws_transfer_server" "sftp" {
  identity_provider_type = "SERVICE_MANAGED"

  tags = {
    NAME     = "${var.aws-transfer-server-name}"
  }
}


resource "aws_iam_role" "iam-role-sftp" {
  name = "${var.IAM-role-name-for-sftp}"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
        "Effect": "Allow",
        "Principal": {
            "Service": "transfer.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy" "iam-role-sftp-policy" {
  name = "${var.s3-access-policy-name}"
  role = "${aws_iam_role.iam-role-sftp.id}"
  policy = "${var.s3-policy-file-location}"

}
resource "aws_transfer_user" "sftp-user" {
  server_id      = "${aws_transfer_server.sftp.id}"
  user_name      = "${var.sftp-user-name}"
  home_directory = "${var.sftp-s3-bucket-name}"
  role           = "${aws_iam_role.iam-role-sftp.arn}"

  tags = {
    NAME = "${var.sftp-user-name}"
  }
}

resource "aws_transfer_ssh_key" "sftp-ssh" {
  server_id = "${aws_transfer_server.sftp.id}"
  user_name = "${aws_transfer_user.sftp-user.user_name}"
  body      = "${var.ssh-public-key-file-location}"
}
