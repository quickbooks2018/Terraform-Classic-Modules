#OUTPUT EC2
output "aws-key-pair" {
  value = "${aws_key_pair.key-pair-name.id}"
}
output "aws-instance" {
  value = ["${aws_instance.cloudelligent-ec2.*.id}"]
}