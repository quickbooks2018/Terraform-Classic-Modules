provider "aws" {
  region = "${var.region}"
}


resource "aws_db_instance" "db" {
  identifier = "${var.identifier}"
  final_snapshot_identifier = "${var.final-snapshot-identifier}"
  allocated_storage = "${var.rds-allocated-storage}"
  engine = "${var.rds-engine}"
  engine_version = "${var.engine-version}"
  instance_class = "${var.db-instance-class}"
  backup_retention_period = "${var.backup-retension-period}"
  backup_window = "${var.backup-window}"
  publicly_accessible = "${var.publicly-accessible}"
  username = "${var.rds-username}"
  password = "${var.rds-password}"
  vpc_security_group_ids = ["${var.vpc-security-group-ids}"]
  db_subnet_group_name = "${aws_db_subnet_group.rds-instance-subnets.name}"
  multi_az = "${var.multi-az}"
  storage_encrypted = "${var.storage-encrypted}"
  deletion_protection = "${var.deletion-protection}"
}


resource "aws_db_subnet_group" "rds-instance-subnets" {
  name = "${var.rds-private-subnets-groups-name}"
  description = "${var.rds-private-subnets-groups-description}"
  subnet_ids = ["${var.aws-db-subnet-group-private-subnets}"]
  tags {
    Name = "${var.name-aws-db-subnet-group}"
  }
}
