provider "aws" {
  region = "${var.region}"
}

resource "aws_lb" "alb" {
  name               = "${var.alb-name}"
  internal           = "${var.internal}"
  load_balancer_type = "application"
  security_groups    = ["${var.alb-sg}"]
  subnets            = ["${var.alb-subnets}"]

  enable_deletion_protection = "true"


  tags = {
    Name = "${var.alb-tag}"
  }
}

resource "aws_alb_listener" "frontend-listner-80" {
  "default_action" {
    target_group_arn = "${aws_lb_target_group.frontend-target-group.arn}"
    type = "forward"
  }
  load_balancer_arn = "${aws_lb.alb.arn}"
  port = 80
}

resource "aws_alb_listener" "frontend-listner-443" {
  "default_action" {
    target_group_arn = "${aws_lb_target_group.frontend-target-group.arn}"
    type = "forward"
  }
  load_balancer_arn = "${aws_lb.alb.arn}"
  port = 443
  protocol = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn = "${var.certificate-arn}"
}



resource "aws_lb_target_group" "frontend-target-group" {
  name     = "${var.tg-name}"
  port     = "${var.port}"
  protocol = "${var.protocol}"
  vpc_id   = "${var.vpc-id}"
}

resource "aws_alb_target_group_attachment" "frontend-attachments" {
  count = "${length(var.no-of-frontend-attachments)}"
  target_group_arn = "${aws_lb_target_group.frontend-target-group.arn}"
  target_id = "${element(var.no-of-frontend-attachments,count.index )}"
}
