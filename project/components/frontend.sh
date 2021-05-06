#!/usr/bin/env bash


source components/common.sh
COMPONENT=frontend

# source is the command which is going to execute all the functions and commands in common.sh and import to the command line
# which is exactly opposite to export what we did while defining functions on server side and access them in intellij


PRINT "Installing Nginx"
yum install nginx -y
STAT $? "Nginx Installation"


PRINT "Download Frontend Component"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
STAT $? "Download Frontend"

PRINT "Extract Frontend"
cd /usr/share/nginx/html
rm -rf *
unzip /tmp/frontend.zip
STAT $? "Extracting Frontend"

mv frontend-main/* .
mv static/* .
rm -rf frontend-master README.md

PRINT "Update Nginx Configuration"
mv localhost.conf /etc/nginx/default.d/roboshop.conf
STAT $? "Update Nginx Configuration"

PRINT "Update Nginx Configuration"
systemctl enable nginx
systemctl restart nginx
STAT $? "Restarting Nginx Service"


