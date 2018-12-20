module "cloudelligent-IAM-Saqlian" {
  source = "./s3-doosra.saqlainmushtaq.com/IAM"

  region = "eu-west-2"
  user-name = "Saqlain-Mushtaq"
  iam-user-tag = "Saqlain-Mushtaq"
  iam-user-policy = "s3"
  bucket-policy = "${file("./s3-doosra.bucketmushtaq.com/bucket-policy/policy.json")}"
}