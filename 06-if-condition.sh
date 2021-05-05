#!/bin/bash


# If can be found in three forms

# 1. Simple IF

# Syntax:
# if [ expression ]; then
#   commands
# fi


# 2. IF Else

# if [ expression ]; then
#   commands-true
# else
#   commands-false
# fi

# 3. Else IF
# if [ expression1 ]; then
#   commands1
# elif [ expression2 ]; then
#   commands2
# else
#   commands
# fi


## Expressions

# 1. String Comparisions

# [ abc = abc ], [ abc == abc ]   , [ abc = "$VAR" ], [ abc != "$VAR" ]

# 2. Numerical Comparisions

# [ 1 -eq 2 ] -> True if both are equal
# [ 1 -ne 2 ]
# [ 1 -gt 2 ]
# [ 1 -lt 2 ]
# [ 1 -le 2 ]
# [ 1 -ge 2 ]

# 3. File Tests
# https://linux.die.net/man/1/bash

## Read a value from user and check if it is less than 10

read -p 'Enter a value(number): ' val

if [ $val -lt 10  ]; then
  echo "Hey, Value is less than 10"
else
  echo "Hey, Value is not less than 10"
fi

