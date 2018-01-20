#!/usr/bin/env ruby

require 'droplet_kit'
require 'yaml'

options = YAML.load_file('mk_droplet.yaml')
client = DropletKit::Client.new(access_token: options['token'])
droplet = DropletKit::Droplet.new(
  name: options['name'],
  region: options['region'],
  image: options['image'],
  size: options['size']
)
created = client.droplets.create(droplet)

printf("%20s: %50s\n", 'Disk space', created.disk)
printf("%20s: %50s\n", 'ID', created.id)
printf("%20s: %50s \n", 'Kernel name', created.kernel.name)
printf("%20s: %50s \n", 'Kernel version', created.kernel.version)
printf("%20s: %50s\n", 'Memory', created.memory)
printf("%20s: %50s\n", 'Name', created.name)
printf("%20s: %50s\n", 'Status', created.status)
printf("%20s: %50s\n", 'CPUs', created.vcpus)
