# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

module ToBoolean
	def to_b
    	return true if self == true || self.to_s.strip =~ /^(true|yes|y|1)$/i
      	return false
    end
end

class NilClass; include ToBoolean; end
class TrueClass; include ToBoolean; end
class FalseClass; include ToBoolean; end
class Numeric; include ToBoolean; end
class String; include ToBoolean; end


dir = File.dirname(File.expand_path(__FILE__))

vagrant_config_file = "#{dir}/config/vagrant_config.yaml"

if (File.exist?(vagrant_config_file))
	puts "Vagrant config file exists, load config..."
else
	abort "Vagrant config file does not exists!"
end

config_yaml = YAML.load_file(vagrant_config_file)

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config_yaml['boxes'].each do |vm|
		box = vm['vm']
		if box['enabled'].to_b == true
			if box['name']
				config.vm.define box['name'] do |b|
					if box['box']
						b.vm.box = box['box']
					end
					if box['hostname']
						b.vm.hostname = box['hostname']
					end
					if box['sync_folder_host'] && box['sync_folder_guest']
						b.vm.synced_folder box['sync_folder_guest'], box['sync_folder_host']
					end
					if defined? box['private_network']
						if box['private_network']['ip']
							b.vm.network :private_network, ip: box['private_network']['ip']
						end
					end
					if defined? box['forwarded_port']
						box['forwarded_port'].each do |ports|
							b.vm.network :forwarded_port,
							guest: ports['guest'],
							host: ports['host'],
							auto_correct: true
						end
					end
					if box['provision']
						args = []
						if box['private_network']['ip']
							args.push box['private_network']['ip']
						else
							args.push '127.0.0.1'
						end
						if defined? box['forwarded_port']
							box['forwarded_port'].each do |ports|
								args.push ports['guest']
							end
						end
						b.vm.provision :shell, :path => box['provision'], :args => args
					end
					if box['provider']
						b.vm.provider box['provider'] do |v|
							v.name = box['name']
							if box['gui']
								v.gui = box['gui']
							end
							if box['ram']
								v.memory = box['ram']
							end
							if box['vram']
								v.customize ["modifyvm", :id, "--vram", box['vram']]
							end
							if box['cpuexecutioncap']
								v.customize ["modifyvm", :id, "--cpuexecutioncap", box['cpuexecutioncap']]
							end
							if box['uartmode1']
								v.customize ["modifyvm", :id, "--uartmode1", box['uartmode1']]
							end
						end
					end
				end
			end
		end
	end
end