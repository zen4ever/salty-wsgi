{{ pillar['redis'] }}:
  pkg.installed

redis-service:
  service.running:
    - name: {{ pillar['redis'] }}
    - enable: True
    - require:
      - pkg: {{ pillar['redis'] }}
