#!/bin/bash
cd "$(dirname "$0")"

make-home-symlinks(){
for dir in Documents Downloads Pictures Templates Videos; do
  if test -f ~/$dir; then
    if ! test -L ~/$dir; then
      if ! rmdir ~/$dir &> /dev/null; then
        if mv -t /mnt/Data/$dir/ ~/$dir/*; then
          rmdir ~/$dir
          ln -sTf /mnt/Data/$dir ~/$dir
        fi
      else
        ln -sTf /mnt/Data/$dir ~/$dir
      fi
    fi
  else
    ln -sTf /mnt/Data/$dir ~/$dir
  fi
done
if test -f ~/Music; then
  if ! test -L ~/Music; then
    if ! rmdir ~/$dir &>/dev/null; then
      if mv -t '/mnt/Data/Songs/Audio Songs/' ~/Music/*; then
        rmdir ~/Music
        ln -sTf '/mnt/Data/Songs/Audio Songs' ~/Music
      fi
    else
      ln -sTf '/mnt/Data/Songs/Audio Songs' ~/Music
    fi
  fi
else
  ln -sTf '/mnt/Data/Songs/Audio Songs' ~/Music
fi
}

if ! { mount | grep '/mnt/Data' &>/dev/null; }; then
 if sudo mkdir -p /mnt/Data && sudo mount LABEL=Data /mnt/Data; then
  make-home-symlinks
 fi
else
 make-home-symlinks
fi

sudo mkdir -p /srv/http
sudo cp -rTf ./srv-http /srv/http

# run scripts
for script in ./scripts/*; do
   "$script"
done
