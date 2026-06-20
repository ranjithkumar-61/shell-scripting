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
    echo "Installing Nginx...FAILURE"
else
    echo "Installing Nginx...SUCCESS"
fi

echo "---Installing Nodejs---"
dnf install nodejs -y

if [ $? -ne 0 ]; then
    echo "Installing nodejs...FAILURE"
else
    echo "Installing nodejs...SUCCESS"
fi

#MYSQL
echo "---Installing Mysql---"
dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "Installing mysql...FAILURE"
else
    echo "Installing mysql...SUCCESS"
fi