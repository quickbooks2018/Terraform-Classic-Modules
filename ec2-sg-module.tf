module "cloudelligent-ec2-sg" {
  source = "./modules/ec2-sg"
  region = "eu-west-2"
  vpc-id = "${module.vpc.vpc-id}"
  ec2-sg-name = "ec2-sg"

  ###SECURITY INBOUND GROUP RULES###
  #RULE-1-INBOUND-RULES
  rule-1-from-port= 80
  rule-1-protocol = "tcp"
  rule-1-to-port = 80
  rule-1-cidr_blocks = "0.0.0.0/0"

  #RULE-2-INBOUND-RULES

  rule-2-from-port = 443
  rule-2-protocol = "tcp"
  rule-2-to-port = 443
  rule-2-cidr_blocks = "0.0.0.0/0"

  #RULE-3-INBOUND-RULES
  rule-3-from-port = 22
  rule-3-protocol = "tcp"
  rule-3-to-port = 22
  rule-3-cidr_blocks = "119.153.149.158/32"


  #RULE-4-INBOUND-RULES
  rule-4-from-port = 10000
  rule-4-protocol =  "tcp"
  rule-4-to-port =   10000
  rule-4-cidr_blocks = "192.168.0.0/16"

  #RULE-5-INBOUND-RULES
  rule-5-from-port = 11000
  rule-5-protocol = "tcp"
  rule-5-to-port = 11000
  rule-5-cidr_blocks = "192.168.1.0/24"

  ###SECURITY GROUP OUTBOUND RULES###
  #RULE-1-OUTBOUND-RULES
  outbound-rule-1-from-port = 0
  outbound-rule-1-protocol = "-1"
  outbound-rule-1-to-port = 0
  outbound-rule-1-cidr_blocks = "0.0.0.0/0"

  #NOTE: ONLY ALL PORTS WILL BE "" & CIDR BLOCK WILL IN COMMAS ""
}
