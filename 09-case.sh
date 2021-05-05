#!/bin/bash

# case can do only else-if scenario.
# case will do only string comparisions

var=$1

case $var in
  catalogue)
    echo "Installing Catalogue"
    ;;
  cart)
    echo "Installing Cart"
    ;;
esac