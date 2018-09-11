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

API_BOX_ENABLED = ENV.fetch('API_BOX_ENABLED') { 'undefined' }
puts "*** API_BOX_ENABLED env. set as:   #{API_BOX_ENABLED}"
SIM_BOX_ENABLED = ENV.fetch('SIM_BOX_ENABLED') { 'undefined' }
puts "*** SIM_BOX_ENABLED env. set as:   #{SIM_BOX_ENABLED}"
BIL_BOX_ENABLED = ENV.fetch('BIL_BOX_ENABLED') { 'undefined' }
puts "*** BIL_BOX_ENABLED env. set as:   #{BIL_BOX_ENABLED}"
CACHE_BOX_ENABLED = ENV.fetch('CACHE_BOX_ENABLED') { 'undefined'  }
puts "*** CACHE_BOX_ENABLED env set as:  #{CACHE_BOX_ENABLED}"
DB_BOX_ENABLED = ENV.fetch('DB_BOX_ENABLED') { 'undefined' }
puts "*** DB_BOX_ENABLED env. set as:    #{DB_BOX_ENABLED}"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config_yaml['boxes'].each do |vm|
		box = vm['vm']
		enabled = false

		if box['name'].include? '.api'
			if API_BOX_ENABLED == 'yes'
				enabled = true
				puts "*** [#{box['name']}] Set box enabled (from env)"
			elsif API_BOX_ENABLED == 'undefined'
				if box['enabled'].to_b == true
					enabled = true
					puts "*** [#{box['name']}] Set box enabled (from config)"
				else
					enabled = false
					puts "*** [#{box['name']}] Set box disabled (from config)"
				end
			elsif API_BOX_ENABLED == 'no'
				enabled = false
				puts "*** [#{box['name']}] Set box disabled (from env)"
			end
		elsif box['name'].include? '.sim'
			if SIM_BOX_ENABLED == 'yes'
				enabled = true
				puts "*** [#{box['name']}] Set box enabled (from env)"
			elsif SIM_BOX_ENABLED == 'undefined'
				if box['enabled'].to_b == true
					enabled = true
					puts "*** [#{box['name']}] Set box enabled (from config)"
				else
					enabled = false
					puts "*** [#{box['name']}] Set box disabled (from config)"
				end
			elsif SIM_BOX_ENABLED == 'no'
				enabled = false
				puts "*** [#{box['name']}] Set box disabled (from env)"
			end
		elsif box['name'].include? '.bil'
			if BIL_BOX_ENABLED == 'yes'
				enabled = true
				puts "*** [#{box['name']}] Set box enabled (from env)"
			elsif BIL_BOX_ENABLED == 'undefined'
				if box['enabled'].to_b == true
					enabled = true
					puts "*** [#{box['name']}] Set box enabled (from config)"
				else
					enabled = false
					puts "*** [#{box['name']}] Set box disabled (from config)"
				end
			elsif BIL_BOX_ENABLED == 'no'
				enabled = false
				puts "*** [#{box['name']}] Set box disabled (from env)"
			end
		elsif box['name'].include? '.cache'
			if CACHE_BOX_ENABLED == 'yes'
				enabled = true
				puts "*** [#{box['name']}] Set box enabled (from env)"
			elsif CACHE_BOX_ENABLED == 'undefined'
				if box['enabled'].to_b == true
					enabled = true
					puts "*** [#{box['name']}] Set box enabled (from config)"
				else
					enabled = false
					puts "*** [#{box['name']}] Set box disabled (from config)"
				end
			elsif CACHE_BOX_ENABLED == 'no'
				enabled = false
				puts "*** [#{box['name']}] Set box disabled (from env)"
			end
		elsif box['name'].include? '.db'
			if DB_BOX_ENABLED == 'yes'
				enabled = true
				puts "*** [#{box['name']}] Set box enabled (from env)"
			elsif DB_BOX_ENABLED == 'undefined'
				if box['enabled'].to_b == true
					enabled = true
					puts "*** [#{box['name']}] Set box enabled (from config)"
				else
					enabled = false
					puts "*** [#{box['name']}] Set box disabled (from config)"
				end
			elsif DB_BOX_ENABLED == 'no'
				enabled = false
				puts "*** [#{box['name']}] Set box disabled (from env)"
			end
		else
			puts "*** [#{box['name']} ] Warning: Unknown name parameter!"
			enabled = false
			puts "*** [#{box['name']}] Set box disabled"
		end

		if enabled == true
			if box['name']
				puts "*** Configure #{box['name']} box..."
				config.vm.define box['name'] do |b|
					if box['box']
						b.vm.box = box['box']
					else
						puts "*** [#{box['name']}] Warning: No box defined!"
					end
					if box['hostname']
						puts "*** [#{box['name']}] Set hostname: #{box['hostname']}..."
						b.vm.hostname = box['hostname']
					else
						puts "*** [#{box['name']}] Warning: No hostname defined!"
					end
					if box['sync_folder_host'] && box['sync_folder_guest']
						puts "*** [#{box['name']}] Set sync. folder for guest: #{box['sync_folder_guest']}..."
						puts "*** [#{box['name']}] Set sync. folder for host:  #{box['sync_folder_host']}..."
						b.vm.synced_folder box['sync_folder_guest'], box['sync_folder_host']
					else
						puts "*** [#{box['name']}] Warning: No sync. folders defined!"
					end
					if defined? box['private_network']
						if box['private_network']['ip']
							puts "*** [#{box['name']}] Set private network IP: #{box['private_network']['ip']}..."
							b.vm.network :private_network, ip: box['private_network']['ip']
						end
					else
						puts "*** [#{box['name']}] Warning: No private network defined!"
					end
					if defined? box['forwarded_port']
						puts "*** [#{box['name']}] Set forwarded ports:"
						box['forwarded_port'].each do |ports|
							puts "*** - guest: #{ports['guest']}"
							puts "*** - host:  #{ports['host']}"
							b.vm.network :forwarded_port,
							guest: ports['guest'],
							host: ports['host'],
							auto_correct: true
						end
					else
						puts "*** [#{box['name']}] Warning: No forwarded ports defined!"
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
						puts "*** [#{box['name']}] Run privision script: #{box['provision']} with arguments: #{args}..."
						b.vm.provision :shell, :path => box['provision'], :args => args
					else
						puts "*** [#{box['name']}] Warning: No provision defined!"
					end
					if box['provider']
						puts "*** [#{box['name']}] Configure provider:"
						puts "*** - gui:    #{box['gui']}"
						puts "*** - ram:    #{box['ram']}"
						puts "*** - vram:   #{box['vram']}"
						puts "*** - cpucap: #{box['cpuexecutioncap']}"
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
					else
						puts "*** [#{box['name']}] Warning: No provider defined!!!"
					end
				end
			end
		end
	end
end
