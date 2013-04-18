debconf-utils:
  pkg.installed

libmysqlclient-dev:
  pkg.installed

ruby1.9.1:
  pkg.installed

ruby1.9.1-dev:
  pkg.installed

libjpeg-dev:
  pkg.installed

libfreetype6:
  pkg.installed

libfreetype6-dev:
  pkg.installed

zlib1g-dev:
  pkg.installed

python-pip:
  pkg.installed:
    - order: 1

{% if grains['os'] == 'Amazon' %}
/usr/bin/pip:
  file.symlink:
    - target: /usr/bin/pip-python
    - order: 1
    - require:
      - pkg: python-pip
{% endif %}

libpq-dev:
  pkg.installed

python-dev:
  pkg.installed

libevent1-dev:
  pkg.installed

foreman:
  gem.installed:
    - require:
      - pkg: ruby1.9.1

en_US.UTF-8:
  locale.system

America/Los_Angeles:
  timezone.system:
    - utc: True
