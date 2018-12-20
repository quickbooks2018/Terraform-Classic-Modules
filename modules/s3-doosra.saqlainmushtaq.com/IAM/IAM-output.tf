#OUTPUT
output "aws-iam-user" {
  value = "${aws_iam_user.user.name}"
}
output "aws-iam-access-key" {
  value = "${aws_iam_access_key.user.secret}"
}
output "aws-iam-user-policy" {
  value = "${aws_iam_user_policy.user.policy}"
}

output "secret" {
  value = "${aws_iam_access_key.user.encrypted_secret}"
}
