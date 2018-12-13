module "cloudelligent-rds-sg-app1" {
  source = "./modules/rds-sg-app1"

  region = "eu-west-2"
  aws-security-group-name = "Cloudelligent-sg-app1"
  vpc-id = "${module.cloudelligent-vpc.vpc-id}"
  aws-security-group-tag-name = "Cloudelligent-sg-app1"

  ###SECURITY INBOUND GROUP RULES###
  #RULE-1-INBOUND-RULES
  rule-1-from-port= 3306
  rule-1-protocol = "tcp"
  rule-1-to-port = 3306
  rule-1-cidr_blocks = "192.168.0.0/16"

  ###SECURITY GROUP OUTBOUND RULES###
  #RULE-1-OUTBOUND-RULES
  outbound-rule-1-from-port = 0
  outbound-rule-1-protocol = "-1"
  outbound-rule-1-to-port = 0
  outbound-rule-1-cidr_blocks = "0.0.0.0/0"

  #NOTE: ONLY ALL PORTS WILL BE "" & CIDR BLOCK WILL IN COMMAS ""



}