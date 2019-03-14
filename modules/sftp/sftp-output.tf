#SFTP

output "sftp-id" {
  value = "${aws_transfer_server.sftp.id}"
}

output "sftp-arn" {
  value = "${aws_transfer_server.sftp.arn}"
}
