{% if grains['os_family'] == 'Debian' %}
vim:
  pkg.installed
{% elif grains['os_family'] == 'RedHat' %}
vim-minimal:
  pkg.installed
{% endif %}

{% if pillar['main_user'] %}
{% set main_user = pillar['main_user'] %}
/home/{{ main_user }}/.vimrc:
  file.managed:
    - user: {{ main_user }}
    - group: {{ main_user }}
    - source: salt://vim/vimrc
{% endif %}
