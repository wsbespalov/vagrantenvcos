# vagrantenvcos

# Test environment for Vagrant containers

This is vagrant box for Ubuntu 16.04 LTS VM running Redis for COS.
There are three containers:

- api: for application

- cache: for redis cache

- db: for mongodb

## Installation

- Install Vagrant on your system, http://downloads.vagrantup.com/

- Install virtualbox on your system, https://www.virtualbox.org/

- Install vagrant plugin, vagrant plugin install vagrant-vbguest

- Clone this repository

- Make shell magic

## Vagrant Box operations

- Run vagrant boxes: ```./start_vagrant.sh ```

- Halt vagrant boxes: ```./stop_vagrant.sh ```

- Destroy vagrant boxes: ```./destroy_vagrant.sh ```

- Reload vagrant boxes: ```./reload_vagrant.sh```

- Reload vagrant boxes with provision: ```./reload_vagrant_provision.sh```

## Sync folders

- Host machine folder:          "."

- Guest machine folder:         "/home/vagrant"

## Start point of NodeJS application

- Location: ```src/server.js```

- Start method: autostart by script command: ```npm install && npm audit fix %% node .```

## Access points for containers

- For API: ```http://192.168.33.10:3000/```
- In server: ```...const hostname = "192.168.33.10"; const port = 3000; server.listen(port, hostname, () => {})```; ...

- For Cache: ```http://192.168.33.10:6379/```

- For MongoDB: ```http://192.168.33.12:27017/```

## Environment variables

Containers controls from next files:

- start.environment

- local.environment (always empty in Git)

## Enable/Disable containers

Containers enables from config/vagrant_config.yaml by the next variables:

- api_box_enabled

- cache_box_enabled

- db_box_enabled