#!/bin/bash -e

mkdir ./src
mkdir ./src/cos-api
mkdir ./src/cos-api/.ssh
mkdir ./src/cos-db
mkdir ./src/cos-db/.ssh
mkdir ./src/cos-cache
mkdir ./src/cos-cache/.ssh

BASEDIR="$(cd "$(dirname "${0}")" && pwd -P)"

shift || true

cd "${BASEDIR}"

echo "Export start ENV..."

if [ -e "start.environment" ]; then
        source "start.environment"
else
        echo "start.environment does not exists. Nothing env. to load."
fi


echo "Generate SSH Keys..."

ssh-keygen -t rsa -N "" -f ~/.ssh/vagrant_rsa &&
# yes y | ssh-keygen -q -t rsa -N "" -f ~/.ssh/vagrant_rsa > /dev/null &&
cp ~/.ssh/vagrant_rsa ./.ssh &&
cp ~/.ssh/vagrant_rsa.pub ./.ssh

echo "Start Vagrant..."

if [ -e "Vagrantfile" ]; then
        vagrant up --provision
else
        echo "Vagrant file does not exists"
fi