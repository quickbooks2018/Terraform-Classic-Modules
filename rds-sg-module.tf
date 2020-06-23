module "rds-sg" {
  source = "./modules/rds-sg"

  region = "eu-west-1"
  aws-security-group-name = "cloudgeeks-sg-rds"
  vpc-id = "${module.vpc.vpc-id}"
  aws-security-group-tag-name = "cloudgeeks-sg-rds"

  ###SECURITY INBOUND GROUP RULES###
  #RULE-1-INBOUND-RULES
  rule-1-from-port= 3306
  rule-1-protocol = "tcp"
  rule-1-to-port = 3306
  rule-1-cidr_blocks = "192.168.0.0/16"

  ###SECURITY INBOUND GROUP RULES###
  #RULE-2-INBOUND-RULES
  rule-2-from-port= 1433
  rule-2-protocol = "tcp"
  rule-2-to-port = 1433
  rule-2-cidr_blocks = "192.168.0.0/16"

  ###SECURITY GROUP OUTBOUND RULES###
  #RULE-1-OUTBOUND-RULES
  outbound-rule-1-from-port = 0
  outbound-rule-1-protocol = "-1"
  outbound-rule-1-to-port = 0
  outbound-rule-1-cidr_blocks = "0.0.0.0/0"

  #NOTE: ONLY ALL PORTS WILL BE "" & CIDR BLOCK WILL IN COMMAS ""



}