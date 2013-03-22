include:
  - core

supervisor:
  pip.installed:
    - require:
      - pkg: python-pip
