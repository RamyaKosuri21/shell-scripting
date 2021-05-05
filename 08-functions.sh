#!/bin/bash

## Determine a function
function abc() {
  echo "Welcome to abc function"
}

xyz() {
  echo "Welcome to xyz function"
}

## Call the function
abc
xyz

xyz

print_value() {
  echo "Input Value is $1"
}

print_value 10
print_value 20
print_value 30

##
# Declare a variable in main program and you can access that in function
A() {
  echo value a = $a
}

a=10
A

# Declare a variable in function and you can access in main program

B() {
  b=20
}

B
echo Value b = $b

# Property of a variable is RW, hence the variables declared in main program can still be overwritten in function and vice-versa

# In some particular cases we need was same variable to be used in main program and function with a different values.
# for this we use function local variables

C() {
  local c=10
  echo Local value c = $c
}

c=20
echo Value of C in main program = $c
C
echo Value of C in main program = $c


## Variables and names are similar
# assign a name to value is variable
# assign a name to commands is function

# Hence the variable properties are applicable for functions as well

# ReadWrite
D() {
  echo hai
}

readonly -f D

# Local
E() {
  echo hai
}

export -f E

# We need to come out of functions with some logics, Exit command cannot be used because it exit the complete script
# For functions we have return command similar like exit and have same exit states.

F() {
  echo hai
  return 10
  echo bye
}

F
echo Exit Status of Function = $?