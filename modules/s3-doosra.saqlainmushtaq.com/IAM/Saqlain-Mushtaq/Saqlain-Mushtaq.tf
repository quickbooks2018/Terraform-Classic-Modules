resource "aws_iam_access_key" "Saqlain-Mushtaq" {
  user    = "${aws_iam_user.Saqlain-Mushtaq.name}"
  pgp_key = "keybase:quickbooks2018"
}

resource "aws_iam_user" "Saqlain-Mushtaq" {
  name = "loadbalancer"
  path = "/system/"
}

resource "aws_iam_user_policy" "Saqlain-Mushtaq-rw" {
  name = "test"
  user = "${aws_iam_user.Saqlain-Mushtaq.name}"

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

output "acces-key" {
  value = "${aws_iam_access_key.Saqlain-Mushtaq.id}"
}
output "secret" {
  value = "${aws_iam_access_key.Saqlain-Mushtaq.encrypted_secret}"
}