provider "aws" {
  region = "eu-west-1"
}

resource "null_resource" "remote-exec" {


  provisioner "file" {
    source = "${file("./modules/remote-exex-provisioners/httpd.sh")}"
    destination  = "/tmp/httpd.sh"
    connection {
      type     = "ssh"
      user     = "ec2-user"
      private_key = "${file("./power.pub")}"
      host     = "${module.ec2-app-v1.aws-instance}"
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
      private_key = "${file("./modules/remote-exex-provisioners/power.pub")}"
      host     = "${module.ec2-app-v1.aws-instance}"
      timeout = "10m"
    }
  }
}

#OUTPUTS
output "remote-exec" {
  value = "${null_resource.remote-exec.id}"
}
