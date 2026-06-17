#!/bin/bash

#Scipt to install the nginx
#id -u --> for root user it will be 0 and normal may be any number

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run the script with root user access"
    exit 1
fi

echo "---Installing Nginx---"
dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "Insatlling Nginx...FAILURE"
else
    echo "Insatlling Nginx...SUCCESS"
fi

echo "---Installing Nodejs---"
dnf install nodejs -y

if [ $? -ne 0 ]; then
    echo "Insatlling nodejs...FAILURE"
else
    echo "Insatlling nodejs...SUCCESS"
fi