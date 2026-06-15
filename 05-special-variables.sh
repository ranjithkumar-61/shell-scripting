#!/bin/bash

##SPECIAL VARIABLES##

echo "All arguments passed to the script: $@"
echo "Number of variables passed to the script: $#"
echo "Scipt name: $0"
echo "Present directory: $PWD"
echo "Who is running: $USER"
echo "Home directory of the current user: $HOME"
echo "PID of the scipt: $$"

sleep 60 &

echo "PID of the recently exceuted background process: $!"
echo "All arguments passed to the script: $*"