debconf-utils:
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
  pkg.installed

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
