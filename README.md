# COS README

# Test environment for Vagrant containers

This is vagrant box for Ubuntu 16.04 LTS VM running Redis for COS.
There are three containers:

- api: for API application

- sim: for simulator application

- bil: for Billing application

- cache: for redis cache

- db: for mongodb

## Installation

- Install Vagrant on your system, http://downloads.vagrantup.com/

- Install virtualbox on your system, https://www.virtualbox.org/

- Install vagrant plugin, vagrant plugin install vagrant-vbguest

- Clone this repository

- Make shell magic

## Vagrant Box operations

- Run vagrant boxes: ```./start.sh ```

- Halt vagrant boxes: ```./stop.sh ```

- Destroy vagrant boxes: ```./destroy.sh ```

- Reload vagrant boxes: ```./reload.sh```

- Reload vagrant boxes with provision: ```./reload_provision.sh```

## Sync folders

- Host machine folder:          "."

- Guest machine folder:         "/home/vagrant"

## Start point of NodeJS applications

- Location: ```src/<project>/server.js```

- Start method: autostart by script command: ```npm install && npm audit fix %% node .```

## Access points for containers

- For API: ```http://192.168.33.10:3000/```

- For Simulator: ```http://192.168.33.11:4000/```

- For Billing: ```http://192.168.33.12:5000/```

- For Cache: ```http://192.168.33.10:6379/```

- For MongoDB: ```http://192.168.33.12:27017/```

## Environment variables

Containers controls from next files:

- start.environment (for Vagrant only)

- local.environment (for every project, always empty in Git)

- default.environment (for every project)

## Enable/Disable containers

Containers enables from config/vagrant_config.yaml by the next variables:

- api_box_enabled

- sim_box_enabled

- bil_box_enabled

- cache_box_enabled

- db_box_enabled

Otherwise, containers enables with start.environment variables (yes/no):

- API_BOX_ENABLED

- SIM_BOX_ENABLED

- BIL_BOX_ENABLED

- CACHE_BOX_ENABLED

- DB_BOX_ENABLED

First of all check box ENV variable, if it equ. 'yes', box will be enabled. If it set as 'no' - box will be disabled. If box ENV variable is undefined, system will check settings in config/vagrant_config.yaml file and define box as enabled/disabled depends from (box_enabled) setting.

Default env. configuration is:

export API_BOX_ENABLED='yes'
export SIM_BOX_ENABLED='no'
export BIL_BOX_ENABLED='no'
export CACHE_BOX_ENABLED='no'
export DB_BOX_ENABLED='no'

These are the local values for varios settings (for Host machine and Vagrant container). start.environment should NOT be committed - it is personal box configuration. Append it in your ```.gitignore``` file!

## Run algorithm

1. User run ```./start.sh``` script. It pull COS Engine Git and compose applications from other Git repositories.
2. It export env. variables from ```start.environment``` and make ```vagrant up```.
3. Set of boxes will start.
4. Every box runs ```./config/provision/BOX_NAME_provision.sh``` script.
5. This script export env. variables from ```default.environment``` and ```local.environment```.
6. Guest sync folders and than run ```./bin/run_BOX_NAME.sh``` script.
7. In every box, will run ```./APPLICATION_NAME/bin/run.sh``` file.
8. Application will run with ```npm install && npm audit fix %% node .```
