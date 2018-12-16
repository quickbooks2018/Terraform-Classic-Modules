module "cloudelligent-rds-app2" {
  source = "./modules/rds-app2-ms-sql"

  region = "eu-west-2"
  identifier = "cloudeligent-db-app2"
  final-snapshot-identifier = "Cloudeligent-db-final-snap-shot-1"
  rds-allocated-storage = "20"
  rds-engine = "sqlserver-ex"
  engine-version = "14.00.1000.169.v1"
  db-instance-class = "db.t2.micro"
  backup-retension-period = "0"
  backup-window = "04:00-06:00"
  publicly-accessible = "false"
  rds-username = "sage"
  rds-password = "cbalallsooslsllsld11P4499Lcba1cba"

  vpc-security-group-ids = "${module.cloudelligent-rds-sg.aws-security-group-rds}"
  rds-private-subnets-groups-name = "cloudelligent-rds-private-subnets-group"
  rds-private-subnets-groups-description = "Allowed Only Private Subnets for Cloudeligent-RDS-MYSQL"
  aws-db-subnet-group-private-subnets = "${module.cloudelligent-vpc.private-subnet-ids}"
  name-aws-db-subnet-group = "cloudeligent-rds-subnets-groups"
}
