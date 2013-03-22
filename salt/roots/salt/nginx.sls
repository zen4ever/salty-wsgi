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

nginx-service:
  service.running:
    - name: nginx
    - enable: True
    - require:
      - pkg: nginx
      - file: /etc/nginx/sites-available/default
