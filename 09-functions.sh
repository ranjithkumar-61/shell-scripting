#!/bin/bash

#FUNCTIONS
#functions are intended to complete specific task, it takes input and does the job
#FUNC_NAME(){
#	$1, $2
#	code
#}

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run the script with root user access"
    exit 1
fi


VALIDATE(){
if [ $1 -ne 0 ]; then
    echo "$2 ... FAILURE"
    exit 1
else
    echo "$2 ... SUCCESS"
fi
}


dnf install nginx -y
VALIDATE $? "Installing Nginx"

dnf install nodejs -y
VALIDATE $? "Installing nodejs"


dnf install mysql -y
VALIDATE $? "mysql"

