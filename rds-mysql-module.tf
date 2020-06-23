module "rds-mysql-app1" {
  source = "./modules/rds-mysql"

  region = "eu-west-2"
  identifier = "cloudeligent-db-app1"
  final-snapshot-identifier = "Cloudeligent-db-final-snap-shot"
  rds-allocated-storage = "5"
  storage-type = "gp2"
  rds-engine = "mysql"
  engine-version = "5.7.17"
  db-instance-class = "db.t2.micro"
  backup-retension-period = "0"
  backup-window = "04:00-06:00"
  publicly-accessible = "false"
  rds-username = "demo"
  rds-password = "thisisjustademo"
  skip-final-snapshot = "true"
  multi-az = "true"
  storage-encrypted = "false"
  deletion-protection = "false"



  vpc-security-group-ids = "${module.rds-sg.aws-security-group-rds}"
  rds-private-subnets-groups-name = "cloudgeeks-rds-private-subnets-group"
  rds-private-subnets-groups-description = "Allowed Only Private Subnets for Cloudeligent-RDS-MYSQL"
  aws-db-subnet-group-private-subnets = "${module.vpc.private-subnet-ids}"
  name-aws-db-subnet-group = "cloudeligent-rds-subnets-groups"
}