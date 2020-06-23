module "auto-scaling" {
  source = "./modules/auto-scaling"

#Note: 1. Create Target Group First
  #    2. Create Application Load Balancer
  #    3. Create Auto-Scaling Group

  region = "eu-west-1"

  #SSH Keys Genration
  key-name = "power"
  public-key-file-name = "${file("./modules/auto-scaling/power.pub")}"

  #Launch Configuration

  launch-configuration-name = "test-lc"
  image-id = "ami-0282da38dbca0973d"
  instance-type = "t2.micro"
  launch-configuration-security-groups = "${module.cloudgeeks-ec2-sg.ec2-sg-security-group}"
  launch-configuration-public-key-name = "power"

  #Auto-Scaling

  autoscaling-group-name = "test-asg"
  max-size = "4"
  min-size = "1"
  health-check-grace-period = "300"
  desired-capacity = "2"
  force-delete = "true"
  #A list of subnet IDs to launch resources in
  vpc-zone-identifier = "${module.vpc.public-subnet-ids}"
  target-group-arns = "arn:aws:elasticloadbalancing:eu-west-1:898668804275:targetgroup/cloudgeeks-tg/bbc376dff9e0dd2f"
  health-check-type = "ELB"
  tag-key = "Name"
  tag-value = "testing"

  #Auto-Scaling Policy-Scale-up
  auto-scaling-policy-name-scale-up = "cpu-policy-scale-up"
  adjustment-type-scale-up = "ChangeInCapacity"
  scaling-adjustment-scale-up = "1"
  cooldown-scale-up = "300"
  policy-type-scale-up = "SimpleScaling"

  #Auto-Scaling Policy Cloud-Watch Alarm-Scale-Up
  alarm-name-scale-up = "cpu-alarm-scale-up"
  comparison-operator-scale-up = "GreaterThanOrEqualToThreshold"
  evaluation-periods-scale-up = "2"
  metric-name-scale-up = "CPUUtilization"
  namespace-scale-up = "AWS/EC2"
  period-scale-up = "120"
  statistic-scale-up = "Average"
  threshold-scale-up = "70"

  #Auto-Scaling Policy-Scale-down
  auto-scaling-policy-name-scale-down = "cpu-policy-scale-down"
  adjustment-type-scale-down = "ChangeInCapacity"
  scaling-adjustment-scale-down = "-1"
  cooldown-scale-down = "300"
  policy-type-scale-down = "SimpleScaling"

  #Auto-Scaling Policy Cloud-Watch Alarm-Scale-down
  alarm-name-scale-down = "cpu-alarm-scale-down"
  comparison-operator-scale-down = "LessThanOrEqualToThreshold"
  evaluation-periods-scale-down = "2"
  metric-name-scale-down = "CPUUtilization"
  namespace-scale-down = "AWS/EC2"
  period-scale-down = "120"
  statistic-scale-down = "Average"
  threshold-scale-down = "50"

}