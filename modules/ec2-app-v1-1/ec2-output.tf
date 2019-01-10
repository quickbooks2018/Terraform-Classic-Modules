#EC2-APP-V1
output "key-pair" {
  value = "${aws_key_pair}"
}

output "ec2-eni-id" {
  value = "${aws_network_interface}"
}

output "ec2-id" {
  value = "${aws_instance}"
}