# install nginx from PPA so we have the latest version
base:
  pkgrepo.managed:
    - ppa: nginx/stable
    - require_in:
      - pkg: nginx

nginx:
  pkg.installed

# on Ubuntu 12.04 this file prevents nginx from launching
/etc/nginx/sites-available/default:
  file.absent:
    - require:
      - pkg: nginx

/etc/nginx/sites-enabled/default:
  file.absent:
    - require:
      - pkg: nginx

/etc/nginx/sites-available:
  file.directory:
    - require:
      - pkg: nginx

/etc/nginx/sites-enabled:
  file.directory:
    - require:
      - pkg: nginx

{% if pillar['main_user'] %}
{% set main_user = pillar['main_user'] %}
{% for project in pillar['projects'] %}
/etc/nginx/sites-enabled/{{ project.nginx.fqdn }}:
  file.managed:
    - source: salt://nginx/site.conf
    - template: jinja
    - context: {{ project.nginx }}
    - defaults:
        ssl: {{ False }}
        aliases: {{ [] }}
        upstreams: {{ [] }}
        default: {{ True }}
        main_user: {{ main_user }}
        app_name: {{ project.name }}
{% endfor %}
{% endif %}

nginx-service:
  service.running:
    - name: nginx
    - enable: True
    - require:
      - pkg: nginx
    - watch:
      - file: /etc/nginx/sites-enabled/*
