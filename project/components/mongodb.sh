#!/usr/bin/env bash

source components/common.sh

# source is the command which is going to execute all the functions and commands in common.sh and import to the command line
# which is exactly opposite to export what we did while defining functions on server side and access them in intellij


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

# systemctl enable mongod
# systemctl start mongod

