#!/bin/bash

echo "*********************************************************************************************"
echo "Go to app folder and install node modules"
cd /home/vagrant/app

echo "List project folder:"
ls

echo "Use npm install & npm audit fix"
npm install
npm audit fix

echo "Run application..."
node .

echo "*********************************************************************************************"
echo "Complete api provision script"
echo "*********************************************************************************************"
