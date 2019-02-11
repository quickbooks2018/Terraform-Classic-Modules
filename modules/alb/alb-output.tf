#OUTPUT
output "aws-alb" {
  value = "${aws_lb.alb.id}"
}

#OUTPUTS

output "alb-frontend-target-group" {
  value = "${aws_lb_target_group.frontend-target-group.id}"
}