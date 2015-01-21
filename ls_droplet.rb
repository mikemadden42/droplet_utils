#!/usr/bin/env ruby

require 'droplet_kit'
require 'yaml'

options = YAML.load_file('ls_droplet.yaml')
client = DropletKit::Client.new(access_token: options['token'])
droplet = client.droplets.find(id: options['id'])

puts droplet.disk
puts droplet.id
puts droplet.kernel.name
puts droplet.kernel.version
puts droplet.memory
puts droplet.name
puts droplet.status
puts droplet.vcpus
pubnet = droplet.networks.v4.find { |n| n.type == 'public' }
puts pubnet.ip_address
