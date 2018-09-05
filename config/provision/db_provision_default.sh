#!/bin/bash

echo "*********************************************************************************************" 
echo "Install MongoDB..." 

cd /opt && \

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4 && \

echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list && \

apt-get update && \
apt-get install mongodb-org -y && \


echo "mongodb-org hold" | dpkg --set-selections && \
echo "mongodb-org-server hold" | dpkg --set-selections && \
echo "mongodb-org-shell hold" | dpkg --set-selections && \
echo "mongodb-org-mongos hold" | dpkg --set-selections && \
echo "mongodb-org-tools hold" | dpkg --set-selections && \
sed -i 's/bindIp: 127.0.0.1/bindIp: "0.0.0.0, 192.168.33.12"\ \n  bindIpAll: true/g' /etc/mongod.conf && \
service mongod restart


echo "*********************************************************************************************" 
echo "Complete db default script$" 
echo "*********************************************************************************************" 