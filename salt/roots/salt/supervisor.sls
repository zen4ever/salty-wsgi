include:
  - virtualenv

supervisor:
  pip.installed:
    - require:
      - pkg: python-pip
