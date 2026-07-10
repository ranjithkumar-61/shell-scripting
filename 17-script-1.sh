#!/bin/bash

COUNTRY=INDIA

echo "Iam in: $COUNTRY"
echo "PID of script-1 is: $$"

echo "Calling one script from another script"

#By this pid will be different and variable calling is different"
#sh 18-script-2.sh

#By this pid wiil be same and variable calling will be same";
source ./18-scripot-2.sh