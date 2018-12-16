#RDS SG OUTPUT
output "aws-security-group-rds-app1" {
  value = "${aws_security_group.rds-sg.id}"
}