#!/bin/bash

# echo 1
# echo 2
# echo 3

# for i in {1...100}
# do
#      echo $i
# done


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

#if package is installed ignore or else install it
for package in $@ # sudo sh 11-loogs.sh mysql nodejs
do 
    dnf list installed $package $>>$LOGS_FILE
    if [ $? -ne 0 ]; then
        echo "$package is not installed, installing now"
        dnf install $package -y &>>$LOGS_FILE
        VALIDATE $? "$package insatallation"
    else
        echo "$package is already installed, skipping"
    fi
done




