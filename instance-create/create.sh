#!/usr/bin/env bash

LID=lt-008b4a05314d92570
LVER=1
aws ec2 run-instances --launch-template LaunchTemplateId=${LID},Version=${LVER} | jq


