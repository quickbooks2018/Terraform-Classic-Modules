#EC2-APP-V1

output "ec2-id" {
  value = "${aws_instance.ec2.id}"
}