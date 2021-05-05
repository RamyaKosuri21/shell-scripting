#!/bin/bash

# Variable is name you give to certain set of data.

## With out variables
echo Welcome to DevOps training
echo Training of DevOps lasts for 70 days
echo "DevOps training covers shell scripting & Ansible"

## Declaring a variable , Syntax: var=data

COURSE=LINUX
echo Welcome to ${COURSE} training
echo Training of $COURSE lasts for 70 days
echo "$COURSE training covers shell scripting & Ansible"

## Variables usually holds a data which varies from time to time.

## Accessing variable can be done with $var and also ${var}

a=100
fruit=Banana
echo $fruit is $ano
echo $fruit is ${a}no


## Variable Names.

# Dynamic Variables

echo Good Morning , Today date is 2021-03-24

# Dynamic variables can be created in two ways
# 1 . Command Substitution, Declaring a variable from command output  , Syntax: var=$(commands)
# 2 . Arithmetic Substitution, Declaring va variable from arthmetic expression, Syntax: var=$((expressions))

DATE=$(date +%F)
echo Good Morning , Today date is ${DATE}
echo Good Morning , Today date is $(date +%F)

ADD=$((2+3))

echo Added value of 2+3 = ${ADD}

echo "Env Variable UID = ${UID}"
echo "ENV variable COURSENAME = ${COURSENAME}"

