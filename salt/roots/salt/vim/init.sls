vim:
  pkg:
    - installed

/home/vagrant/.vimrc:
  file:
    - managed
    - source: salt://vim/vimrc
