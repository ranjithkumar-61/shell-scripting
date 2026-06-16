#!/bin/bash

#Scipt to install the nginx

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run the script with root user access"
    exit 1
fi

echo "---Installing Nginx---"
dnf insatll nginx -y

if [ $? -ne 0 ]; then
    echo "Insatlling Nginx...FAILURE"
else
    echo "Insatlling Nginx...SUCCESS"
fi