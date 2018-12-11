#OUTPUT EC2-SG
output "ec2-sg-security-group" {
  value = "${aws_security_group.ec2-sg.id}"
}
