#!/usr/bin/env bash

echo # | ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
echo # | Run provision for CACHE box
echo # | ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

apt-get update --quiet

echo # | ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
echo # | Install packages
echo # | ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

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

echo # | ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
echo # | Install Redis Cache
echo # | ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

cd /opt

mkdir /opt/redis
cd /opt/redis
wget -q http://download.redis.io/redis-stable.tar.gz
tar -xz --keep-newer-files -f redis-stable.tar.gz
cd redis-stable
make
make install
rm /etc/redis.conf
mkdir -p /etc/redis
mkdir /var/redis
chmod -R 777 /var/redis
useradd redis

cp -u /home/vagrant/config/provision/redis.conf /etc/redis/6379.conf
cp -u /home/vagrant/config/provision/redis.init.d /etc/init.d/redis_6379

update-rc.d redis_6379 defaults

chmod a+x /etc/init.d/redis_6379
/etc/init.d/redis_6379 start


echo "arguments = ${@}"

if [ $# -gt 0 ]; then
	mapped_ip=$1
else
	mapped_ip="127.0.0.1"
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

echo # | ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
echo # | Complete
echo # | ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░