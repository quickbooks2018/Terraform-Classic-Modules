#!/bin/bash

yum install -y httpd
service httpd start
chkconfig httpd on
echo "<h1>Alhumdulliah Terraform By Muhammad Asim</h1>" > /var/www/html/index.html

#END