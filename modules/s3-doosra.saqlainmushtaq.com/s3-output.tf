#OUTPUT
output "doosra-bucketmushtaq-com" {
  value = "${aws_s3_bucket.bucket.id}"
}