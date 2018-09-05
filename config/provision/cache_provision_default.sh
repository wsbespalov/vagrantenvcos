#!/bin/bash

echo "*********************************************************************************************" 
echo "Install redis-server..." 
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

cp -u /home/vagrant/config/redis.conf /etc/redis/6379.conf
cp -u /home/vagrant/config/redis.init.d /etc/init.d/redis_6379

update-rc.d redis_6379 defaults

chmod a+x /etc/init.d/redis_6379
/etc/init.d/redis_6379 start