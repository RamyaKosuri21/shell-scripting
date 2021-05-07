#!/usr/bin/env bash

LID=lt-008b4a05314d92570
LVER=1
COMPONENT=$1

if [ -z "${COMPONENT}" ]; then
  echo "Component Name Input is needed"
  exit 1
fi

INSTANCE_EXISTS=$(aws ec2 describe-instances --filters Name=tag:Name,Values=${COMPONENT}  | jq .Reservations[])
  STATE=$(aws ec2 describe-instances --filters Name=tag:Name,Values=${COMPONENT}  | jq .Reservations[].Instances[].State.Name | xargs)
  if [ -z "${INSTANCE_EXISTS}" -o "$STATE" == "terminated"  ]; then
    aws ec2 run-instances --launch-template LaunchTemplateId=${LID},Version=${LVER}  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${COMPONENT}}]" | jq
  else
    echo "Instance ${COMPONENT} already exists"
  fi

