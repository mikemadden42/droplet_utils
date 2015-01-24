#!/usr/bin/env ruby

require 'droplet_kit'
require 'yaml'

options = YAML.load_file('ls_droplet.yaml')
client = DropletKit::Client.new(access_token: options['token'])
droplet = client.droplets.find(id: options['id'])

printf("%20s: %50s\n", 'Disk space', droplet.disk)
printf("%20s: %50s\n", 'ID', droplet.id)
printf("%20s: %50s \n", 'Kernel name', droplet.kernel.name)
printf("%20s: %50s \n", 'Kernel version', droplet.kernel.version)
printf("%20s: %50s\n", 'Memory', droplet.memory)
printf("%20s: %50s\n", 'Name', droplet.name)
printf("%20s: %50s\n", 'Status', droplet.status)
printf("%20s: %50s\n", 'CPUs', droplet.vcpus)
pubnet = droplet.networks.v4.find { |n| n.type == 'public' }
printf("%20s: %50s\n", 'IP', pubnet.ip_address)
