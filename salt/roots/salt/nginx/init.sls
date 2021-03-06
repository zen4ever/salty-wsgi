# install nginx from PPA so we have the latest version
{% if grains['os'] == 'Amazon' %}
nginx:
  pkgrepo.managed:
    - humanname: nginx repo
    - baseurl: http://nginx.org/packages/centos/5/$basearch/
    - gpgcheck: 0
    - enabled: 1
    - require_in:
      - pkg: nginx
{% elif grains['os'] == 'Ubuntu' %}
base:
  pkgrepo.managed:
    - ppa: nginx/stable
    - require_in:
      - pkg: nginx
{% endif %}

apache2.2-common:
  pkg.purged

nginx:
  pkg.installed:
    - require:
      - pkg: apache2.2-common


{% if grains['os'] == 'Ubuntu' %}
# on Ubuntu 12.04 this file prevents nginx from launching
/etc/nginx/sites-available/default:
  file.absent:
    - require:
      - pkg: nginx
{% endif %}

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

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://nginx/nginx.conf
    - template: jinja
    - context: {{ pillar['nginx'] }}
    - defaults:
      main_user: {{ main_user }}
      workers: 4
    - require:
      - pkg: nginx

{% for project in pillar['projects'] %}
/etc/nginx/sites-enabled/{{ project.nginx.fqdn }}:
  file.managed:
    - source: salt://nginx/site.conf
    - template: jinja
    - context: {{ project.nginx }}
    - defaults:
        ssl: {{ False }}
        timeout: 60
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
      - file: /etc/nginx/sites-enabled/default
      - file: /etc/nginx/nginx.conf
    - watch:
      - file: /etc/nginx/sites-enabled/*
      - file: /etc/nginx/nginx.conf
