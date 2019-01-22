provider "aws" {
  region = "eu-west-1"
}

resource "null_resource" "remote-exec" {


  provisioner "file" {
    source = "${file("./httpd.sh")}"
    destination  = "/tmp/httpd.sh"
    connection {
      type     = "ssh"
      user     = "ec2-user"
      private_key = "${file("./power.pub")}"
      host     = ""
      timeout = "10m"
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/httpd.sh",
      "sudo /tmp/httpd.sh"
    ]
    connection {
      type     = "ssh"
      user     = "ec2-user"
      private_key = "${file("./power.pub")}"
      host     = "176.34.158.169"
      timeout = "10m"
    }
  }
}

#OUTPUTS
output "remote-exec" {
  value = "${null_resource.remote-exec.id}"
}
