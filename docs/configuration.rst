Pillar configuration
====================

Configuration data is kept in `Salt Pillar`_, in files :file:`data.sls` and
:file:`top.sls`. The:file:`top.sls` file is responsible for the fact which server gets
which `pillar` data. It matters mostly if you are going to have multi-server
setup. For our simple example it just sends `pillar` from :file:`data.sls`
to all servers. ::

    base:
      '*':
        - data


The :file:`data.sls` file is much more interesting. It contains data about
things like under which user all our processes are going to run,
who are going to have access to deployment, which projects are we going to
deploy, etc. ::

    main_user:
      companyname

    deployers:
      - github: yourgithubusername

    projects:
      - name: projectname
        branch: master
        django_settings: projectname.settings
        requirements: requirements.txt
        port_base: 5000
        nginx:
          fqdn: www.example.com
          default: False
          upstreams:
            - localhost:5000

    nginx:
      workers: 4

Here ``main_user`` is a username of Unix user which will own all your web processes.
It doesn't have sudo access by default, so even if your web application gets compromised,
attacker wouldn't get a control of the whole server.

The second variable ``deployers`` is a list of GitHub usernames for the people who
are going to deploy your project. The `Salty WSGI` will automatically pull their public keys
from GitHub, and place them in the :file:`.ssh/authorized_keys` of your ``main_user``.

Then there is a list of your ``projects``.

``name``
    `Salty WSGI` will create a bare repo at :file:`.repos/{name}.git`, working directory
    at :file:`{name}` and virtual environment at :file:`.virtualenvs/{name}-env`

``branch``
    Name of a git branch, which you are going to use for deployment.
    By default deployment repository is created by cloning ``master`` branch from
    the bare repo.

``django_settings``
    Is required only for Django projects, and should contain a name of your settings module.

``requirements``
    Path to your :file:`requrements.txt` file relatively to the project's root.

``port_base``
    This variable is used to generate Supervisord config from your :file:`Procfile`.

``nginx``
    Some variables for your Nginx site configuration.
    Make sure that only one project has `default` value as ``True``.

The last variable allows you to set a number of Nginx workers.


.. _`Salt Pillar`: https://salt.readthedocs.org/en/latest/topics/pillar/
