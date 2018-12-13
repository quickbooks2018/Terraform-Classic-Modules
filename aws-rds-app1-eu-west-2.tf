module "cloudelligent-rds-app1" {
  source = "./modules/rds-app1"

  region = "eu-west-2"
  identifier = "cloudeligent-db-app1"
  #final-snapshot-identifier = "Cloudeligent-db-final-snap-shot-1"
  rds-allocated-storage = "5"
  storage-type = "gp2"
  rds-engine = "mysql"
  engine-version = "5.7.17"
  db-instance-class = "db.t2.micro"
  backup-retension-period = "0"
  backup-window = "04:00-06:00"
  publicly-accessible = "false"
  rds-username = "sage"
  rds-password = "cbalallsooslsllsld11P4499Lcba1cba"
  skip-final-snapshot = "true"
  multi-az = "true"
  storage-encrypted = "false"


  vpc-security-group-ids = "${module.cloudelligent-rds-sg-app1.aws-security-group-rds-app1}"
  rds-private-subnets-groups-name = "cloudelligent-rds-private-subnets-group"
  rds-private-subnets-groups-description = "Allowed Only Private Subnets for Cloudeligent-RDS-MYSQL"
  aws-db-subnet-group-private-subnets = "${module.cloudelligent-vpc.private-subnet-ids}"
  name-aws-db-subnet-group = "cloudeligent-rds-subnets-groups"
}