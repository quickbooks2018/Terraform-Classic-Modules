#LAUNCH CONFIGURATION
output "launch-configuration" {
  value = "${aws_launch_configuration.launch-configuration-ec2-app.id}"
}