#!/usr/bin/env bash

#!/bin/bash

# exit status is the status of the command executed. Meaning every command after its execution it sends its status by returning exit status.
# Exit status is a number and can be accessed  by a variable (?), $? to access the variable


# Exit states ranges from 0-255
# 0 - success
# 1-255 - non success / partial success

# In shell scripting this status number we can use to tell that the script execution is a failure by using exit command.

#exit  ## returns 0 which means success

exit 1

# 1-255 are not not users
# only 1-125 are for users , 125+ are used by system.