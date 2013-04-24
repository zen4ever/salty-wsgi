{% if grains['os_family'] == 'Debian' %}
debconf-utils:
  pkg.installed

libmysqlclient-dev:
  pkg.installed

libjpeg-dev:
  pkg.installed

libfreetype6:
  pkg.installed

libfreetype6-dev:
  pkg.installed

zlib1g-dev:
  pkg.installed

libpq-dev:
  pkg.installed

python-dev:
  pkg.installed

libevent1-dev:
  pkg.installed
{% endif %}

{% if grains['os_family'] == 'RedHat' %}
make:
  pkg.installed

glibc-devel:
  pkg.installed

gcc:
  pkg.installed

mysql:
  pkg.installed

mysql-devel:
  pkg.installed

libjpeg-devel:
  pkg.installed

freetype:
  pkg.installed

freetype-devel:
  pkg.installed

python-devel:
  pkg.installed

zlib-devel:
  pkg.installed

libevent-devel:
  pkg.installed

postgresql-devel:
  pkg.installed
{% endif %}

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

en_US.UTF-8:
  locale.system

America/Los_Angeles:
  timezone.system:
    - utc: True
