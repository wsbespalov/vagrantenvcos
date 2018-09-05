#!/bin/bash

echo "*********************************************************************************************"
echo "Start cache provision script"
echo "*********************************************************************************************"

echo "Update system..."
apt-get update --quiet

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

echo "Update system..."
apt-get update --quiet

gem install redis