include:
  - core

virtualenv:
  pip.installed:
    - require:
      - pkg: python-pip

virtualenvwrapper:
  pip.installed:
    - require:
      - pip: virtualenv
