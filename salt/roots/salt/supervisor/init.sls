# installing supervisor from pip
# since we are going to run in manually
# under our deployment user

supervisor:
  pip.installed:
    - require:
      - pkg: python-pip

{% if pillar['main_user'] %}
{% set main_user = pillar['main_user'] %}

{% if grains['os'] == 'Ubuntu' %}
/etc/init/supervisor.conf:
  file.managed:
    - source: salt://supervisor/init.conf
    - template: jinja
    - require:
      - pip: supervisor
      - user: {{ main_user }}
      - group: {{ main_user }}
    - defaults:
      main_user: {{ main_user }}
{% endif %}

{% if grains['os'] == 'Amazon' %}
/etc/init.d/supervisor:
  file.managed:
    - source: salt://supervisor/init_amazon
    - mode: 755
    - template: jinja
    - require:
      - pip: supervisor
      - user: {{ main_user }}
      - group: {{ main_user }}
    - defaults:
      main_user: {{ main_user }}
{% endif %}

/etc/supervisor:
  file.directory:
    - user: {{ main_user }}
    - group: {{ main_user }}
    - mode: 750
    - makedirs: True
    - require:
      - pip: supervisor
      - user: {{ main_user }}
      - group: {{ main_user }}

/etc/supervisor/conf.d:
  file.directory:
    - user: {{ main_user }}
    - group: {{ main_user }}
    - mode: 750
    - makedirs: True
    - require:
      - file: /etc/supervisor

/etc/supervisord.conf:
  file.managed:
    - user: {{ main_user }}
    - group: {{ main_user }}
    - source: salt://supervisor/supervisord.conf
    - template: jinja
    - require:
      - pip: supervisor
      - user: {{ main_user }}
      - group: {{ main_user }}
    - defaults:
      main_user: {{ main_user }}

supervisor-service:
  service.running:
    - name: supervisor
    - watch:
      - file: /etc/supervisord.conf
    - require:
      - file: /etc/supervisord.conf
{% endif %}
