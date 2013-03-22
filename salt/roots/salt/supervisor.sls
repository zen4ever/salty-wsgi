# it is better to install supervisor from Ubuntu repos
# this way we have supervisor service and default config
supervisor:
  pkg:
    - installed
  service.running:
    - require:
      - pkg: supervisor
