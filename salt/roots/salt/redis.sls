redis-server:
  pkg.installed

redis-service:
  service.running:
    - name: redis-server
    - enable: True
    - require:
      - pkg: redis-server
