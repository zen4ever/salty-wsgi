main_user:
  marpasoft

deployers:
  - github: girla
  - github: zen4ever

projects:
  - name: topper
    branch: master
    provider: gunicorn
    wsgi_module: topper.wsgi
    requirements: requirements/production.txt
    port_base: 5000
    nginx:
      fqdn: topper.marpasoft.com
      upstreams:
        - localhost:5000
