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

  # config.ssh.username = 'vagrant'
  # config.ssh.password = 'vagrant'
  config.ssh.private_key_path = '~/.ssh/vagrant_rsa'
  config.ssh.insert_key = true
  # allow guest os to use host os ssh keys
  config.ssh.forward_agent = true

  # forward the ports
  PORTS.each do |port|
    config.vm.network :forwarded_port, guest: port, host: port
  end

  # share some folders
  config.vm.synced_folder "~/src/", "/home/vagrant/src"

  # set up app
  # config.vm.provision "shell",
  #   inline:
  # "cd /home/vagrant/src/characturge-rails
  # bi
  # databases=\"$(psql -U vagrant -d vagrant -c \"SELECT datname FROM pg_database;\" | grep ^' ' | grep -v ^'  ')\"
  #   if test \"echo $databases | awk -F \"characturge\" '{print NF-1}'\" < 1 ; then
  #   rake db:create
  # fi
  # rake db:migrate
  # "
end
