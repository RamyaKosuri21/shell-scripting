#!/usr/bin/env bash

source components/common.sh

# source is the command which is going to execute all the functions and commands in common.sh and import to the command line
# which is exactly opposite to export what we did while defining functions on server side and access them in intellij


PRINT "Installing Nginx"
yum install nginx -y
STAT $? "Nginx Installation"

exit


echo "------------------------------------------------------------------------------------------"



systemctl enable nginx
systemctl start nginx

curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"

 cd /usr/share/nginx/html
 rm -rf *
 unzip /tmp/frontend.zip
 mv frontend-main/* .
 mv static/* .
 rm -rf frontend-master README.md
 mv localhost.conf /etc/nginx/default.d/roboshop.conf


 systemctl restart nginx
