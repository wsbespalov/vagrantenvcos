#!/bin/bash

cd /home/vagrant/app

echo "*********************************************************************************************"
echo "Download nodejs setup file..."
curl -sL https://deb.nodesource.com/setup_8.x | bash -

echo "*********************************************************************************************"
echo "Update system..."
apt-get update --quiet

echo "*********************************************************************************************"
echo "Update system..."
apt-get install -y nodejs

echo "*********************************************************************************************"
echo "Update npm..."
npm install npm --global

cd /home/vagrant/app

echo "*********************************************************************************************"
echo "Install nodemon..."
npm install -g nodemon

echo "*********************************************************************************************"
echo "Current node version"
node --version

echo "*********************************************************************************************"
echo "Install yarn..."
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
apt-get update --quiet
sudo apt-get install yarn

echo "*********************************************************************************************"
echo "Install bower..."
npm install bower

echo "*********************************************************************************************"
echo "Install gulp..."
npm install gulp

echo "*********************************************************************************************"
echo "Install webpack..."
npm install webpack

echo "*********************************************************************************************"
echo "Install mongoose..."
npm install mongoose

echo "*********************************************************************************************"
echo "Install karma..."
npm install karma-cli

echo "*********************************************************************************************"
echo "Install express..."
npm install express

echo "Update system..."
apt-get update --quiet