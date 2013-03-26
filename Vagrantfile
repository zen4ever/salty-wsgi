# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  ## Chose your base box
  config.vm.box = "precise64"
  config.vm.box_url = "https://s3-us-west-2.amazonaws.com/squishy.vagrant-boxes/precise64_squishy_2013-02-09.box"
  config.vm.host_name = "admanager"

  config.vm.forward_port 8000, 8000

  ## For masterless, mount your salt file root
  config.vm.share_folder "roots", "/srv", "salt/roots"


  ## Use all the defaults:
  config.vm.provision :salt do |salt|
    salt.run_highstate = true

    ## Optional Settings:
    # salt.minion_config = "salt/minion.conf"
    # salt.temp_config_dir = "/existing/folder/on/basebox/"
    salt.salt_install_type = "git"
    salt.salt_install_args = "develop"

    ## If you have a remote master setup, you can add
    ## your preseeded minion key
    # salt.minion_key = "salt/key/minion.pem"
    # salt.minion_pub = "salt/key/minion.pub"
  end
end
