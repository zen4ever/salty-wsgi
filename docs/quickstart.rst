Quickstart
==========

The fastest way to start using Salty WSGI is to try it with Vagrant_.

First you will need to install the latest version of Vagrant_ from its Downloads_ page.

Then install `Salty Vagrant`_ by running a command ::

  vagrant plugin install vagrant-salt

Add your own values to :file:`salt/roots/pillar/data.sls`,
then run ``vagrant up`` and you should be good to go.


.. _Vagrant: http://www.vagrantup.com/
.. _Downloads: http://downloads.vagrantup.com 
.. _Saltstack: http://saltstack.com/
.. _`Salty Vagrant`: https://github.com/saltstack/salty-vagrant 
