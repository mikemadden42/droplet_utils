#!/usr/bin/env ruby

require 'droplet_kit'
require 'yaml'

options = YAML.load_file('mk_droplet.yaml')
client = DropletKit::Client.new(access_token: options['token'])
droplet = DropletKit::Droplet.new(
        name: options['name'],
        region: options['region'],
        image: options['image'],
        size: options['size'])
created = client.droplets.create(droplet)

puts created.disk
puts created.id
puts created.kernel.name
puts created.kernel.version
puts created.memory
puts created.name
puts created.status
puts created.vcpus
