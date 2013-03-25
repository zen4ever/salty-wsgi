main_user:
  marpasoft

deployers:
  - github: girla
  - github: zen4ever

projects:
  - name: admanager
    branch: master
    provider: gunicorn
    wsgi_module: admanager.wsgi
    requirements: requirements.txt
    nginx:
      fqdn: admanager.marpasoft.com
      port: 5001
