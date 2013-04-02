.. Salty WSGI documentation master file, created by
   sphinx-quickstart on Mon Apr  1 17:47:51 2013.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to Salty WSGI's documentation!
======================================

`Salty WSGI`_ is a set of Saltstack_ configuration states for easy deployment of
Python WSGI apps (Django_, Flask_, etc) with Supervisord_, Nginx_, Virtualenv_.

It is oriented towards making a deployment (and continuous deployment) of Django_/WSGI apps
as easy as possible.

Workflow for initial deployment:
--------------------------------

 - Develop your Python website.
   Place the list of your dependencies into :file:`requirements.txt`.
 - Create :file:`Procfile` with services that needs to be running (Gunicorn_, Celery_, etc.)
 - Provision your virtual machine with Saltstack_ and a set of `Salty WSGI`_ configs
 - Add your deployment repo to git remotes ::

     $ git remote add deploy deployment_user@deployment_server:.repos/project_name.git

 - Push your code to the server :: 

     $ git push deploy master

 - Your website should be up and running.

Workflow for updating your website:
-----------------------------------

  - Just push your code to the server ::

     $ git push deploy

Read more about how to start with Salty WSGI:
---------------------------------------------

.. toctree::
   quickstart
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
