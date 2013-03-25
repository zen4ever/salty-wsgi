debconf-utils:
  pkg.installed

python-pip:
  pkg.installed

libpq-dev:
  pkg.installed

python-dev:
  pkg.installed

foreman:
  gem.installed

en_US.UTF-8:
  locale.system

America/Los_Angeles:
  timezone.system:
    - utc: True
