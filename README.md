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

- Run vagrant boxes: ```./bin/run.sh ```

- Halt vagrant boxes: ```./bin/halt.sh ```

- Destroy vagrant boxes: ```./bin/destroy.sh ```

- Reload vagrant boxes: ```./bin/reload.sh```

- Reload vagrant boxes with provision: ```./bin/reload_provision.sh```

## Sync folders

- Host machine folder:          "."

- Guest machine folder:         "/home/vagrant"

## Start point of NodeJS application

- Location: ```app/server.js```

- Start method: autostart by script command: ```npm install && npm audit fix %% node .```

## Access points for containers

- For API: ```http://192.168.33.10:3000/```
- In server: ```...const hostname = "192.168.33.10"; const port = 3000; server.listen(port, hostname, () => {})```; ...

- For Cache: ```http://192.168.33.10:6379/```

- For MongoDB: ```http://192.168.33.12:27017/```

## Environment variables

Containers controls from next files:

- default.environment

- tests.environment

Main parameters are:
- VM_BOX_TYPE="ubuntu/xenial64"

- VM_BOX_UART_MODE="disconnected"

- VM_API_BOX_RAM="1024"

- VM_API_BOX_VRAM="128"

- VM_API_BOX_GUI="True"

- VM_API_BOX_NAME="cos.api"

- VM_API_BOX_HOSTNAME="cos.api.box"

- VM_API_BOX_CPUEXECUTIONCAP="50"

- VM_API_BOX_SYNCED_FOLDER_HOST="."

- VM_API_BOX_SYNCED_FOLDER_GUEST="/home/vagrant"

- VM_API_BOX_SYNCED_FOLDER_OWNER="vagrant"

- VM_API_BOX_SYNCED_FOLDER_GROUP="vagrant"

- VM_API_BOX_FORWARDED_PORT_HOST="3000"

- VM_API_BOX_FORWARDED_PORT_GUEST="3000"

- VM_API_BOX_PRIVATE_NETWORK_IP="192.168.33.10"

And the same parameters for _CACHE_ and _DB_.

Additional parameters are:

- STAGE="dev"

- RUN_TESTS="False"

- LOAD_CACHE_FIXTURES="False"

- LOAD_DB_FIXTURES="False"