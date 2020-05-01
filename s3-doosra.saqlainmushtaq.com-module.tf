module "infragurus-s3-doosra-bucketmushtaq-com" {
  source = "./modules/s3-doosra.saqlainmushtaq.com"

  region = "eu-west-2"
  bucket-name = "doosra.saqlainmushtaq.com"
  acl = "private"
  versioning-enable = "true"
  tag = "doosra.bucketmushtaq.com"

}