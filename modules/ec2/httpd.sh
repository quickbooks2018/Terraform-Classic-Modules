#!/bin/bash

yum install -y httpd
service httpd start
chkconfig httpd on
echo "<h1>Cloudelligent in Canada</h1>" > /var/www/html/index.html







#END