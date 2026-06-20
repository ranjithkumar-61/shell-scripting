#!/bin/bash

set -e # this will be checking for errors if errors it will exit
trap 'echo "There is an error in $LINENO, Command: $BASH_COMMAND"' ERR

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"

if [ $USERID -ne 0 ]; then
    echo -e "$R Please run the script with root user access $N" | tee -a $LOGS_FILE
    exit 1
fi


#If folder is not there it will create or else leave it
mkdir -p $LOGS_FOLDER


# #$1, $2 argumnets
# VALIDATE(){
# if [ $1 -ne 0 ]; then
#     echo -e "$2 ... $R FAILURE $N " | tee -a $LOGS_FILE
#     exit 1
# else
#     echo -e "$2 ... $G SUCCESS $Y" | tee -a $LOGS_FILE
# fi
# }

#if package is installed ignore or else install it
for package in $@ # sudo sh 11-loogs.sh mysql nodejs
do 
    dnf list installed $package &>>$LOGS_FILE
    if [ $? -ne 0 ]; then
        echo "$package is not installed, installing now"
        dnf install $package -y &>>$LOGS_FILE
        #VALIDATE $? "$package insatallation"
    else
        echo -e "$package is already installed, $Y SKIPPING $N"
    fi
done