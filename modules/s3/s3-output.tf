#OUTPUT
output "s3-bucket-id" {
  value = "${aws_s3_bucket.bucket.id}"
}

output "s3-bucket-arn" {
  value = "${aws_s3_bucket.bucket.arn}"
}