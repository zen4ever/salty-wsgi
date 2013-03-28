# user without sudo access
# which will own web processes
# and which folder will contain your project
main_user:
  companyname

# GitHub names of people who will have
# ssh access to your VM
# Salt pulls their public keys to /home/main_user/.ssh/authorized_keys
# from https://github.com/username.keys
deployers:
  - github: yourgithubusername

projects:
  - name: projectname
    branch: master
    provider: gunicorn
    wsgi_module: projectname.wsgi
    requirements: requirements.txt
    port_base: 5000
    nginx:
      fqdn: www.example.com
      upstreams:
        - localhost:5000
