module "cloudelligent-IAM-Saqlain" {
  source = "./modules/s3-doosra.saqlainmushtaq.com/IAM-saqlain-s3-doosra.saqlainmushtaq.com"

  region = "eu-west-2"
  user-name = "Saqlain-Mushtaq"
  iam-user-tag = "Saqlain-Mushtaq"
  iam-user-policy = "s3"
}
