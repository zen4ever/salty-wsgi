vim:
  pkg.installed

{% if pillar['main_user'] %}
{% set main_user = pillar['main_user'] %}
/home/{{ main_user }}/.vimrc:
  file.managed:
    - source: salt://vim/vimrc
{% endif %}
