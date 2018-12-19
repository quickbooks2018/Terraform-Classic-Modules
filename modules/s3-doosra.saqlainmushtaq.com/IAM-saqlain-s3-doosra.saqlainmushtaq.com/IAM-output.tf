#OUTPUT
output "aws-iam-user" {
  value = "${aws_iam_user.saqlain.name}"
}
output "aws-iam-access-key" {
  value = "${aws_iam_access_key.saqlain.secret}"
}
output "aws-iam-user-policy" {
  value = "${aws_iam_user_policy.saqlain.policy}"
}