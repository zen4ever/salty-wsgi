.. Salty WSGI documentation master file, created by
   sphinx-quickstart on Mon Apr  1 17:47:51 2013.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to Salty WSGI's documentation!
======================================

`Salty WSGI`_ is a set of Saltstack_ configuration states for easy deployment of
Python WSGI apps (Django_, Flask_, etc) with Supervisord_, Nginx_, Virtualenv_.

It is oriented towards making a continuous deployment of Django_/WSGI apps
as simple as possible.

Initial deployment:
-------------------

 - Place the list of your dependencies into :file:`requirements.txt`.
 - Create :file:`Procfile` with services that needs to be running (Gunicorn_, Celery_, etc.)
 - Copy :file:`salt/roots/pillar/data.sls.example` -> :file:`salt/roots/pillar/data.sls`,
   :file:`salt/roots/pillar/top.sls.example` -> :file:`salt/roots/pillar/top.sls`.
   And fill in your values in :file:`data.sls`. Read more in :doc:`/configuration`.
 - Provision your virtual machine with Saltstack_ and a set of `Salty WSGI`_ configs
 - Apply salt configuration ::
     $  salt-call state.highstate --local
 - Add your deployment repo to git remotes ::
     
     $ git remote add deploy {user}@{server}:.repos/{project_name}.git
     
     where user - is a user you specified in data.sls 

 - Push your code to the server :: 

     $ git push deploy master

 - Run ``syncdb`` or similar command for creating your database
 - Your website should be up and running.

Updating your website:
----------------------

 - Just push your code to the server ::

     $ git push deploy

Read more about how to start with Salty WSGI:
---------------------------------------------

.. toctree::
   quickstart
   configuration
   :maxdepth: 2



Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`

.. _Saltstack: http://saltstack.com/
.. _Supervisord: http://supervisord.org
.. _Nginx: http://nginx.org/
.. _Virtualenv: https://pypi.python.org/pypi/virtualenv
.. _Django: https://www.djangoproject.com
.. _Flask: http://flask.pocoo.org
.. _Gunicorn: http://gunicorn.org
.. _Celery: http://celeryproject.org 
.. _`Salty WSGI`: https://github.com/zen4ever/salty-wsgi
