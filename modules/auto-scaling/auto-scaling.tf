provider "aws" {
  region = "${var.region}"
}

#CREATING A NEW KEY PAIR AND EXPORTING OUR PUBLIC-KEY
resource "aws_key_pair" "key-pair" {
  key_name = "${var.key-name}"
  public_key = "${var.public-key-file-name}"
}

resource "aws_launch_configuration" "launch-configuration" {
  name = "${var.launch-configuration-name}"
  image_id = "${var.image-id}"
  instance_type = "${var.instance-type}"
  security_groups = ["${var.launch-configuration-security-groups}"]
  #Public keyname already attached in AWS Console
  key_name = "${var.launch-configuration-public-key-name}"
}

resource "aws_autoscaling_group" "autoscaling-group" {
  name = "${var.autoscaling-group-name}"
  launch_configuration = "${aws_launch_configuration.launch-configuration.name}"
  max_size = "${var.max-size}"
  min_size = "${var.min-size}"
  health_check_grace_period = "${var.health-check-grace-period}"
  #Group-Size or desired capacity
  desired_capacity = "${var.desired-capacity}"
  force_delete = "${var.force-delete}"
  #A list of subnet IDs to launch resources in
  vpc_zone_identifier = ["${var.vpc-zone-identifier}"]
  health_check_type = "${var.health-check-type}"
  target_group_arns = ["${var.target-group-arns}"]

  tag {
    key = "${var.tag-key}"
    propagate_at_launch = true
    value = "${var.tag-value}"
  }
}

#Policy Scale Up
resource "aws_autoscaling_policy" "auto-scaling-policy-scale-up" {
  autoscaling_group_name = "${aws_autoscaling_group.autoscaling-group.name}"
  name = "${var.auto-scaling-policy-name-scale-up}"
  adjustment_type = "${var.adjustment-type-scale-up}"
  scaling_adjustment = "${var.scaling-adjustment-scale-up}"
  cooldown = "${var.cooldown-scale-up}"
  policy_type = "${var.policy-type-scale-up}"
}

resource "aws_cloudwatch_metric_alarm" "cpu-alarm-scale-up" {
  alarm_name = "${var.alarm-name-scale-up}"
  comparison_operator = "${var.comparison-operator-scale-up}"
  evaluation_periods = "${var.evaluation-periods-scale-up}"
  metric_name = "${var.metric-name-scale-up}"
  namespace = "${var.namespace-scale-up}"
  period = "${var.period-scale-up}"
  statistic = "${var.statistic-scale-up}"
  threshold = "${var.threshold-scale-up}"
  dimensions {
    "AutoScalingGroupName" = "${aws_autoscaling_group.autoscaling-group.name}"
  }
    actions_enabled = true
    alarm_actions = ["${aws_autoscaling_policy.auto-scaling-policy-scale-up.arn}"]

}

#Policy Scale down

resource "aws_autoscaling_policy" "auto-scaling-policy-scale-down" {
  autoscaling_group_name = "${aws_autoscaling_group.autoscaling-group.name}"
  name = "${var.auto-scaling-policy-name-scale-down}"
  adjustment_type = "${var.adjustment-type-scale-down}"
  scaling_adjustment = "${var.scaling-adjustment-scale-down}"
  cooldown = "${var.cooldown-scale-down}"
  policy_type = "${var.policy-type-scale-down}"
}

resource "aws_cloudwatch_metric_alarm" "cpu-alarm-scale-down" {
  alarm_name = "${var.alarm-name-scale-down}"
  comparison_operator = "${var.comparison-operator-scale-down}"
  evaluation_periods = "${var.evaluation-periods-scale-down}"
  metric_name = "${var.metric-name-scale-down}"
  namespace = "${var.namespace-scale-down}"
  period = "${var.period-scale-down}"
  statistic = "${var.statistic-scale-down}"
  threshold = "${var.threshold-scale-down}"
  dimensions {
    "AutoScalingGroupName" = "${aws_autoscaling_group.autoscaling-group.name}"
  }
  actions_enabled = true
  alarm_actions = ["${aws_autoscaling_policy.auto-scaling-policy-scale-down.arn}"]

}

