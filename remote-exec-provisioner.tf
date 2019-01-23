provider "aws" {
  region = "eu-west-1"
}

resource "null_resource" "remote-exec" {
  count = "${length(module.ec2-app-v1.ec2-public-ip)}"


  provisioner "file" {
    source = "./modules/remote-exex-provisioners/httpd.sh"
    destination  = "/tmp/httpd.sh"
    connection {
      type     = "ssh"
      user     = "ec2-user"
      private_key = "${file("./power.pub")}"
      host     = "${element(module.ec2-app-v1.ec2-public-ip,count.index )}"
      timeout = "2m"
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
      host     = "${element(module.ec2-app-v1.ec2-public-ip,count.index )}"
      timeout = "2m"
    }
  }
}

#OUTPUTS
output "remote-exec" {
  value = "${null_resource.remote-exec.*.id}"
}
