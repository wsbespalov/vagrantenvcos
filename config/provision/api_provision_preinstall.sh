#!/bin/bash

echo "*********************************************************************************************"
echo "Start cache preinstall script"
echo "*********************************************************************************************"

cd /home/vagrant/app

echo "*********************************************************************************************"
echo "Update system..."
apt-get update --quiet

echo "*********************************************************************************************"
echo "Install curl..."
apt-get install curl

echo "*********************************************************************************************"
echo "Install libs..."
apt-get install libncurses5-dev

echo "*********************************************************************************************"
echo "Install git..."
apt-get install git

echo "*********************************************************************************************"
echo "Install gcc, g++, make..."
apt-get install -y gcc g++ make

echo "*********************************************************************************************"
echo "Install build-essential..."
apt-get install -y build-essential

echo "*********************************************************************************************"
echo "Install python-software-properties"
apt-get install -y python-software-properties

echo "*********************************************************************************************"
echo "Install python-dev..."
apt-get install -y python-dev

echo "*********************************************************************************************"
echo "Install ruby stuff..."
RUBY_VERSION="2.5.1"
if ! type rvm >/dev/null 2>&1; then
    curl -sSL https://rvm.io/mpapis.asc | gpg --import -
    curl -L https://get.rvm.io | bash -s stable
    source /etc/profile.d/rvm.sh
fi

if ! rvm list rubies ruby | grep ruby-${RUBY_VERSION}; then
    rvm install ${RUBY_VERSION}
fi

rvm --default use ${RUBY_VERSION}
source /etc/profile.d/rvm.sh

echo "*********************************************************************************************"
echo "Update system..."
apt-get update --quiet