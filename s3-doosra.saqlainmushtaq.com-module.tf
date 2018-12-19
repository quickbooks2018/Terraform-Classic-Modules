module "cloudelligent-s3-doosra.saqlainmushtaq.com" {
  source = "./modules/s3-doosra.saqlainmushtaq.com"

  region = "eu-west-2"
  bucket-name = "doosra.saqlainmushtaq.com"
  acl = "private"
  versioning-enable = "true"
  tag = "doosra.saqlainmushtaq.com"

}