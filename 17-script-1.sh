#!/bin/bash

COUNTRY=INDIA

echo "Iam in: $COUNTRY"
echo "PID of script-1 is: $$"

echo "Calling one script from another script"

#By this pid will be different and variable calling is different"
#sh 18-script-2.sh

#By this pid wiil be same and if we dont declare the variable in script2 it will call variable from script1(everything is same as script1)"
source ./18-script-2.sh