#!/bin/bash

read -p 'Enter your Name: ' name
read -p 'Enter the Course: ' course

echo -e "\n Name = $name , Course = $course"

# this is not a great way of doing for automation, as we rae interrupting in between.We need to give input, but it should not interrupt at the same time