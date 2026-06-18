#!/bin/bash

#logs --> The output of the script is stored in logs
#ls -l 1> output.txt --> stores the success output
#lsd -l 2> output.txt --> stores the failure output
#ls -l &> output.txt --> stores both success and failure output (overrides the O/P)
#ls -l &>> output.txt --> stores both success and failure output (appends the O/P)
#ls -l | tee -a output.txt --> it displays the o/p and stores the o/p in a file both success and failure (a --> appends the o/p)


USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"

if [ $USERID -ne 0 ]; then
    echo "Please run the script with root user access" | tee -a $LOGS_FILE
    exit 1
fi

#If folder is not there it will create or else leave it
mkdir -p $LOGS_FOLDER

#$1, $2 argumnets

VALIDATE(){
if [ $1 -ne 0 ]; then
    echo "$2 ... FAILURE" | tee -a $LOGS_FILE
    exit 1
else
    echo "$2 ... SUCCESS" | tee -a $LOGS_FILE
fi
}


dnf install nginx -y &>> $LOGS_FILE
VALIDATE $? "Installing Nginx"

dnf install nodejs -y &>> $LOGS_FILE
VALIDATE $? "Installing nodejs"

dnf install mysql -y &>> $LOGS_FILE
VALIDATE $? "Installing mysql"

