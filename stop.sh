#!/bin/bash -e

rm -rf .DS_Store
rm -rf .config/
rm -rf .cache/
rm -rf .npm/
rm -rf .vagrant/


echo "Stop Vagrant..."

if [ -e "Vagrantfile" ]; then
        vagrant halt && vagrant destroy
        vagrant global-status --prune
else
        echo "Vagrant file does not exists"
fi


