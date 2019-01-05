#OUTPUT EC2
output "aws-key-pair" {
  value = "${aws_key_pair.key-pair.id}"
}
output "aws-instance" {
  value = ["${aws_instance.ec2.*.id}"]
}