#RDS SG OUTPUT
output "aws-security-group-rds" {
  value = "${aws_security_group.rds-sg.id}"
}