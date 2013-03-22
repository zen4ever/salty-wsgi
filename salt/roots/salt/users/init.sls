{% if pillar['main_user'] %}
{% set main_user = pillar['main_user'] %}
# create default deployment user
{{ main_user }}:
  group:
    - present
  user.present:
    - home: /home/{{ main_user }}
    - shell: /bin/bash
    - groups:
      - {{ main_user }}
    - require:
      - group: {{ main_user }}

# make sure that github fingerprint is in the known hosts for our user
github.com:
  ssh_known_hosts:
    - present
    - user: {{ main_user }} 
    - fingerprint: 16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48
    - require:
      - user: {{ main_user }}
      - file: /home/{{ main_user }}/.ssh

/home/{{ main_user }}:
  file.directory:
    - user: {{ main_user }}
    - mode: 750
    - makedirs: True
    - require:
      - user: {{ main_user }}

/home/{{ main_user }}/.bashrc:
  file.managed:
    - user: {{ main_user }}
    - mode: 755
    - source: salt://users/bashrc
    - require:
      - file: /home/{{ main_user }}

/home/{{ main_user }}/.ssh:
  file.directory:
    - user: {{ main_user }}
    - mode: 700
    - makedirs: True
    - require:
      - file: /home/{{ main_user }}

/home/{{ main_user }}/.virtualenvs:
  file.directory:
    - user: {{ main_user }}
    - mode: 766
    - makedirs: True
    - require:
      - file: /home/{{ main_user }}

# grant ssh access to our deployers
# pull their public keys from their github profiles
{% for deployer in pillar['deployers'] %}
grant-access-{{ deployer.github }}:
  ssh_auth:
    - present
    - user: {{ pillar['main_user'] }}
    - source: https://github.com/{{ deployer.github }}.keys
    - require:
      - file: /home/{{ main_user }}/.ssh
{% endfor %}
{% endif %}
