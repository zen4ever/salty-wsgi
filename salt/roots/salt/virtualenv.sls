basepkgs:
  pkg.installed:
    - pkgs:
      - debconf-utils
      - python-pip

virtualenv:
  pip.installed:
    - require:
      - pkg: python-pip

virtualenvwrapper:
  pip.installed:
    - require:
      - pkg: virtualenv 

/var/virtualenv:
  virtualenv.managed:
    - no_site_packages: True
    - require:
      - pkg: virtualenv
