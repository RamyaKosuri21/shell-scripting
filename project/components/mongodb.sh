#!/usr/bin/env bash

source components/common.sh
COMPONENT=mongodb

# source is the command which is going to execute all the functions and commands in common.sh and import to the command line
# which is exactly opposite to export what we did while defining functions on server side and access them in intellij
OS_Prereqs

PRINT "Setup Mongodb Repository"
echo '[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.2.asc' >/etc/yum.repos.d/mongodb.repo
STAT $? "Setup Mongodb repository"

PRINT "Install Mongodb"
yum install -y mongodb-org
STAT $? "Installation of Mongodb"

PRINT "Update mongodb configuration file"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
STAT $? "Updating Mongodb configuration file"

PRINT "Start Mongodb Service"
systemctl enable mongod
systemctl start mongod
STAT $? " Starting Mongodb"

PRINT "Download Mongodb Schemas"
curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip"
STAT $? "Downloading Schema"

PRINT "Extract Mongodb Schemas"
cd /tmp
unzip -o mongodb.zip
STAT $? 'Extracting Mongodb schemas'

PRINT "Load Schema"
cd mongodb-main
mongo < catalogue.js && mongo < users.js
STAT $? "Loading schema"




