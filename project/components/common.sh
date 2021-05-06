#!/usr/bin/env bash

USER_ID=$(id -u)
if [ "${USER_ID}" -ne 0 ] ; then
  echo -e "\e[1;31mYou should be a root user to perform this command\e[0m"
  exit 1
 fi

 # set-hostname automatically with in the script
set-hostname ${COMPONENT}
disable-auto-shutdown


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

