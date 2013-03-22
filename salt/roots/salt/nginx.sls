base:
  pkgrepo.managed:
    - ppa: nginx/stable
    - require_in:
      - pkg: nginx

nginx:
  pkg.installed

nginx-service:
  service.running:
    - name: nginx
    - enable: True
    - require:
      - pkg: nginx
