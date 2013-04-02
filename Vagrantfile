# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  ## Chose your base box
  config.vm.box = "precise64"
  config.vm.box_url = "https://s3-us-west-2.amazonaws.com/squishy.vagrant-boxes/precise64_squishy_2013-02-09.box"

  config.vm.network :forwarded_port, host: 8000, guest: 8000

  ## For masterless, mount your salt file root
  config.vm.synced_folder "salt/roots/", "/srv/"

  ## Use all the defaults:
  config.vm.provision :salt do |salt|

    salt.run_highstate = true

  end
end
