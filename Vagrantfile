# -*- mode: ruby -*-
# vi: set ft=ruby :

module ToBoolean
    def to_bool
      return true if self == true || self.to_s.strip =~ /^(true|yes|y|1)$/i
      return false
    end
  end

class NilClass; include ToBoolean; end
class TrueClass; include ToBoolean; end
class FalseClass; include ToBoolean; end
class Numeric; include ToBoolean; end
class String; include ToBoolean; end

STAGE = ENV.fetch('STAGE', 'dev').to_s

RUN_TESTS = ENV.fetch('RUN_TESTS', false).to_bool

VM_BOX_TYPE = ENV.fetch('VM_BOX_TYPE', 'ubuntu/xenial64').to_s
VM_BOX_UART_MODE = ENV.fetch('VM_BOX_UART_MODE', 'disconnected').to_s

LOAD_CACHE_FIXTURES = ENV.fetch('LOAD_CACHE_FIXTURES', false).to_bool
LOAD_DB_FIXTURES = ENV.fetch('LOAD_DB_FIXTURES', false).to_bool

VM_API_BOX_RAM = ENV.fetch('VM_API_BOX_RAM', 1024).to_i
VM_API_BOX_VRAM = ENV.fetch('VM_API_BOX_VRAM', 128).to_i
VM_API_BOX_GUI = ENV.fetch('VM_API_BOX_VRAM', true).to_bool
VM_API_BOX_NAME = ENV.fetch('VM_API_BOX_NAME', 'cos.api').to_s
VM_API_BOX_HOSTNAME = ENV.fetch('VM_API_BOX_HOSTNAME', 'cos.api.box').to_s
VM_API_BOX_CPUEXECUTIONCAP = ENV.fetch('VM_API_BOX_CPUEXECUTIONCAP', "50").to_s
VM_API_BOX_SYNCED_FOLDER_HOST = ENV.fetch('VM_API_BOX_SYNCED_FOLDER_HOST', ".").to_s
VM_API_BOX_SYNCED_FOLDER_GUEST = ENV.fetch('VM_API_BOX_SYNCED_FOLDER_GUEST', "/home/vagrant").to_s
VM_API_BOX_SYNCED_FOLDER_OWNER = ENV.fetch('VM_API_BOX_SYNCED_FOLDER_OWNER', 'vagrant').to_s
VM_API_BOX_SYNCED_FOLDER_GROUP = ENV.fetch('VM_API_BOX_SYNCED_FOLDER_GROUP', 'vagrant').to_s
VM_API_BOX_FORWARDED_PORT_HOST = ENV.fetch('VM_API_BOX_FORWARDED_PORT_HOST', 3000).to_i
VM_API_BOX_FORWARDED_PORT_GUEST = ENV.fetch('VM_API_BOX_FORWARDED_PORT_GUEST', 3000).to_i
VM_API_BOX_PRIVATE_NETWORK_IP = ENV.fetch('VM_API_BOX_PRIVATE_NETWORK_IP', '192.168.33.10').to_s

VM_CACHE_BOX_RAM = ENV.fetch('VM_API_BOX_RAM', 1024).to_i
VM_CACHE_BOX_VRAM = ENV.fetch('VM_API_BOX_VRAM', 128).to_i
VM_CACHE_BOX_GUI = ENV.fetch('VM_API_BOX_VRAM', false).to_bool
VM_CACHE_BOX_NAME = ENV.fetch('VM_API_BOX_NAME', 'cos.cahe').to_s
VM_CACHE_BOX_HOSTNAME = ENV.fetch('VM_API_BOX_HOSTNAME', 'cos.cahe.box').to_s
VM_CACHE_BOX_CPUEXECUTIONCAP = ENV.fetch('VM_API_BOX_CPUEXECUTIONCAP', "75").to_s
VM_CACHE_BOX_SYNCED_FOLDER_HOST = ENV.fetch('VM_API_BOX_SYNCED_FOLDER_HOST', ".").to_s
VM_CACHE_BOX_SYNCED_FOLDER_GUEST = ENV.fetch('VM_API_BOX_SYNCED_FOLDER_GUEST', "/home/vagrant").to_s
VM_CACHE_BOX_SYNCED_FOLDER_OWNER = ENV.fetch('VM_API_BOX_SYNCED_FOLDER_OWNER', 'vagrant').to_s
VM_CACHE_BOX_SYNCED_FOLDER_GROUP = ENV.fetch('VM_API_BOX_SYNCED_FOLDER_GROUP', 'vagrant').to_s
VM_CACHE_BOX_FORWARDED_PORT_HOST = ENV.fetch('VM_API_BOX_FORWARDED_PORT_HOST', 6379).to_i
VM_CACHE_BOX_FORWARDED_PORT_GUEST = ENV.fetch('VM_API_BOX_FORWARDED_PORT_GUEST', 6379).to_i
VM_CACHE_BOX_PRIVATE_NETWORK_IP = ENV.fetch('VM_API_BOX_PRIVATE_NETWORK_IP', '192.168.33.11').to_s

VM_DB_BOX_RAM = ENV.fetch('VM_API_BOX_RAM', 1024).to_i
VM_DB_BOX_VRAM = ENV.fetch('VM_API_BOX_VRAM', 128).to_i
VM_DB_BOX_GUI = ENV.fetch('VM_API_BOX_VRAM', false).to_bool
VM_DB_BOX_NAME = ENV.fetch('VM_API_BOX_NAME', 'cos.db').to_s
VM_DB_BOX_HOSTNAME = ENV.fetch('VM_API_BOX_HOSTNAME', 'cos.db.box').to_s
VM_DB_BOX_CPUEXECUTIONCAP = ENV.fetch('VM_API_BOX_CPUEXECUTIONCAP', "75").to_s
VM_DB_BOX_SYNCED_FOLDER_HOST = ENV.fetch('VM_API_BOX_SYNCED_FOLDER_HOST', ".").to_s
VM_DB_BOX_SYNCED_FOLDER_GUEST = ENV.fetch('VM_API_BOX_SYNCED_FOLDER_GUEST', "/home/vagrant").to_s
VM_DB_BOX_SYNCED_FOLDER_OWNER = ENV.fetch('VM_API_BOX_SYNCED_FOLDER_OWNER', 'vagrant').to_s
VM_DB_BOX_SYNCED_FOLDER_GROUP = ENV.fetch('VM_API_BOX_SYNCED_FOLDER_GROUP', 'vagrant').to_s
VM_DB_BOX_FORWARDED_PORT_HOST = ENV.fetch('VM_API_BOX_FORWARDED_PORT_HOST', 27017).to_i
VM_DB_BOX_FORWARDED_PORT_GUEST = ENV.fetch('VM_API_BOX_FORWARDED_PORT_GUEST', 27017).to_i
VM_DB_BOX_PRIVATE_NETWORK_IP = ENV.fetch('VM_API_BOX_PRIVATE_NETWORK_IP', '192.168.33.12').to_s


Vagrant.configure("2") do |config|
    config.vm.define "api" do |api|
        api.vm.box = VM_BOX_TYPE

        api.vm.synced_folder VM_API_BOX_SYNCED_FOLDER_HOST, VM_API_BOX_SYNCED_FOLDER_GUEST, owner: VM_API_BOX_SYNCED_FOLDER_OWNER, group: VM_API_BOX_SYNCED_FOLDER_GROUP

        api.ssh.insert_key = false

        api.vm.provider "virtualbox" do |v|
            v.name = VM_API_BOX_NAME
            v.gui = VM_API_BOX_GUI
            v.memory = VM_API_BOX_RAM
            v.customize ["modifyvm", :id, "--vram", VM_API_BOX_VRAM]
            v.customize ["modifyvm", :id, "--cpuexecutioncap", VM_API_BOX_CPUEXECUTIONCAP]
            v.customize ["modifyvm", :id, "--uartmode1", VM_BOX_UART_MODE]
        end

        api.vm.network :forwarded_port, guest: VM_API_BOX_FORWARDED_PORT_GUEST, host: VM_API_BOX_FORWARDED_PORT_HOST, auto_correct: true
        api.vm.network :forwarded_port, guest: 3030, host: 3030, auto_correct: true

        api.vm.network :private_network, ip: VM_API_BOX_PRIVATE_NETWORK_IP

        api.vm.hostname = VM_API_BOX_HOSTNAME

        api.vm.provision :shell, :path => "config/provision/append_swap_file.sh"
        api.vm.provision :shell, :path => "config/provision/api_provision_preinstall.sh"
        api.vm.provision :shell, :path => "config/provision/api_provision_default.sh"
        api.vm.provision :shell, :path => "config/provision/api_provision_postinstall.sh"

        if RUN_TESTS == true
            api.vm.provision :shell, :path => "config/provision/api_run_tests.sh"
        end
    end


    config.vm.define "cache" do |cache|
        cache.vm.box = VM_BOX_TYPE

        cache.vm.synced_folder VM_CACHE_BOX_SYNCED_FOLDER_HOST, VM_CACHE_BOX_SYNCED_FOLDER_GUEST, owner: VM_CACHE_BOX_SYNCED_FOLDER_OWNER, group: VM_CACHE_BOX_SYNCED_FOLDER_GROUP

        cache.ssh.insert_key = false

        cache.vm.provider "virtualbox" do |v|
            v.name = VM_CACHE_BOX_NAME
            v.gui = VM_CACHE_BOX_GUI
            v.memory = VM_CACHE_BOX_RAM
            v.customize ["modifyvm", :id, "--vram", VM_CACHE_BOX_VRAM]
            v.customize ["modifyvm", :id, "--cpuexecutioncap", VM_CACHE_BOX_CPUEXECUTIONCAP]
            v.customize ["modifyvm", :id, "--uartmode1", VM_BOX_UART_MODE]
        end

        cache.vm.network :forwarded_port, guest: VM_CACHE_BOX_FORWARDED_PORT_GUEST, host: VM_CACHE_BOX_FORWARDED_PORT_HOST, auto_correct: true

        cache.vm.network :private_network, ip: VM_CACHE_BOX_PRIVATE_NETWORK_IP

        cache.vm.hostname = VM_CACHE_BOX_HOSTNAME

        cache.vm.provision :shell, :path => "config/provision/append_swap_file.sh"
        cache.vm.provision :shell, :path => "config/provision/cache_provision_preinstall.sh"
        cache.vm.provision :shell, :path => "config/provision/cache_provision_default.sh"
        cache.vm.provision :shell, :path => "config/provision/cache_provision_postinstall.sh"

        if LOAD_CACHE_FIXTURES == true
            cache.vm.provision :shell, :path => "bin/load_cache_fixtures.sh"
        end

    end


    config.vm.define "db" do |db|
        db.vm.box = VM_BOX_TYPE

        db.vm.synced_folder VM_DB_BOX_SYNCED_FOLDER_HOST, VM_DB_BOX_SYNCED_FOLDER_GUEST, owner: VM_DB_BOX_SYNCED_FOLDER_OWNER, group: VM_DB_BOX_SYNCED_FOLDER_GROUP

        db.vm.provider "virtualbox" do |v|
            v.name = VM_DB_BOX_NAME
            v.gui = VM_DB_BOX_GUI
            v.memory = VM_DB_BOX_RAM
            v.customize ["modifyvm", :id, "--vram", VM_DB_BOX_VRAM]
            v.customize ["modifyvm", :id, "--cpuexecutioncap", VM_DB_BOX_CPUEXECUTIONCAP]
            v.customize ["modifyvm", :id, "--uartmode1", VM_BOX_UART_MODE]
        end

        db.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true
        db.vm.network :forwarded_port, guest: VM_DB_BOX_FORWARDED_PORT_GUEST, host: VM_DB_BOX_FORWARDED_PORT_HOST, auto_correct: true

        db.vm.network :private_network, ip: VM_DB_BOX_PRIVATE_NETWORK_IP

        db.vm.hostname = VM_DB_BOX_HOSTNAME

        db.vm.provision :shell, :path => "config/provision/append_swap_file.sh"
        db.vm.provision :shell, :path => "config/provision/db_provision_preinstall.sh"
        db.vm.provision :shell, :path => "config/provision/db_provision_default.sh"
        db.vm.provision :shell, :path => "config/provision/db_provision_postinstall.sh"

        if LOAD_DB_FIXTURES == true
            db.vm.provision :shell, :path => "bin/load_db_fixtures.sh"
        end
    end
end