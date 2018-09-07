#!/usr/bin/env bash

apt-get update --quiet

export DEBIAN_FRONTEND=noninteractive

sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confnew" install autoconf
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confnew" install g++
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confnew" install git
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confnew" install curl
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confnew" install make
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confnew" install openssl
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confnew" install libssl-dev
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confnew" install libsasl2-dev
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confnew" install libcurl4-openssl-dev
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confnew" install pkg-config

cd /opt

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4

echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list

apt-get update

sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confnew" install mongodb-org

echo "mongodb-org hold" | dpkg --set-selections
echo "mongodb-org-server hold" | dpkg --set-selections
echo "mongodb-org-shell hold" | dpkg --set-selections
echo "mongodb-org-mongos hold" | dpkg --set-selections
echo "mongodb-org-tools hold" | dpkg --set-selections

echo "arguments = ${@}"

if [ $# -gt 0 ]; then
	mapped_ip=$1
fi

if [ $# -gt 1 ]; then
	len=$#
	mapped_ports=${@:2:len-1}
fi

for mp in ${mapped_ports}
do
	echo "Allow port ${mp}"
	sudo ufw allow $mp
done

#
# Repair
#


sudo sed -i 's/bindIp: 127.0.0.1/bindIp: "0.0.0.0, 192.168.33.12"\ \n  bindIpAll: true/g' /etc/mongod.conf
# sudo sed -i 's/bindIp: 127.0.0.1/bindIp: "0.0.0.0, ${mapped_ip}"\ \n  bindIpAll: true/g' /etc/mongod.conf
# sudo python3 repl.py ${mapped_ip}

# service mongod restart
sudo systemctl enable mongod
sudo systemctl start mongod