#!/usr/bin/env bash

USER_ID=$(id -u)
if [ "${USER_ID}" -ne 0 ] ; then
  echo -e "\e[1;31mYou should be a root user to perform this command\e[0m"
  exit 1
 fi

 # set-hostname automatically with in the script
OS_Prereqs()
{
set-hostname ${COMPONENT}
disable-auto-shutdown
}

 PRINT()
 {
echo "------------------------------------------------------------------------------"
echo -e "\e[1;35m [INFO] $1 \e[0m"
echo "------------------------------------------------------------------------------"
 }

 STAT()
 {
if [ $? -ne 0 ] ;then
  echo "------------------------------------------------------------------------------"
  echo -e "\e[1;31m [ERROR] $2 is failure\e[0m"
  echo "------------------------------------------------------------------------------"
  exit 2
else
  echo "------------------------------------------------------------------------------"
  echo -e "\e[1;32m [SUCC] $2 is successful\e[0m"
  echo "------------------------------------------------------------------------------"
  fi

 }

 NodeJS_Install()
 {
   PRINT "Install NodeJS"
   yum install nodejs make gcc-c++ -y
   STAT $? "Installing NodeJS"
 }

RoboShop_App_User_Add()
{
  id roboshop
  if [ $? -eq 0 ]; then
   PRINT "create RoboShop Application User - User Already Exists"
   return
  fi
  PRINT "Create RoboShop Application User"
  useradd roboshop
  STAT $? "Creating Application User"
}

Download_Component_From_Github()
{
  PRINT "Download ${COMPONENT} Component"
  curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/roboshop-devops-project/${COMPONENT}/archive/main.zip"
  STAT $? "Downloading ${COMPONENT}"
}

Extract_Component()
{
  PRINT "Extract ${COMPONENT} "
  cd /home/roboshop
  rm -rf ${COMPONENT} && unzip /tmp/${COMPONENT}.zip && mv ${COMPONENT}-main ${COMPONENT}
  STAT $? "Downloading ${COMPONENT}"
}

Install_NodeJS_Dependencies()
{
  PRINT"Download NodeJS Dependencies"
  cd /home/roboshop/catalogue
  npm install --unsafe-perm
  STAT $? "Downloading Dependencies"
}

Setup_Service()
{
  PRINT "Setup SystemD Service for ${COMPONENT}"
  mv /home/roboshop/${COMPONENT}/systemd.service /etc/systemd/system/${COMPONENT}.service
  sed -i -e 's/MONGO_DNSNAME/' /etc/systemd/system/${COMPONENT}.service
  systemctl daemon-reload && systemctl start ${COMPONENT} && systemctl enable ${COMPONENT}
  STAT $? "Starting ${COMPONENT} Service "
}

NodeJS_Setup()
{
NodeJS_Install
RoboShop_App_User_Add
Download_Component_From_Github
Extract_Component
Install_NodeJS_Dependencies
Setup_Service
}

