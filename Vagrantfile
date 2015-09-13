# -*- mode: ruby -*-
# vi: set ft=ruby :

# ports to forward
PORTS = [
  3000, # rails application
  5432, # psql
  2812, # monit
]

Vagrant.configure(2) do |config|
  # Every Vagrant development environment requires a box.
  config.vm.box = "angelamancini/centos71-x64"
  config.vm.hostname = 'devbox'

  config.ssh.username = 'vagrant'
  config.ssh.password = 'vagrant'

  # allow guest os to use host os ssh keys
  config.ssh.forward_agent = true

  # forward the ports
  PORTS.each do |port|
    config.vm.network :forwarded_port, guest: port, host: port
  end

  # share some folders
  config.vm.synced_folder "~/src/", "/home/vagrant/src"

end
