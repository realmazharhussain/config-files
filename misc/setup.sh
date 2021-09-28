#!/bin/bash
cd "$(dirname "$0")"

make-home-symlinks(){
for dir in Documents Downloads Pictures Templates Videos; do
  if ! test -L ~/$dir; then
    if ! rmdir ~/$dir &> /dev/null; then
      if mv -t /mnt/Data/$dir/ ~/$dir/*; then
        rmdir ~/$dir
        cp -sTf /mnt/Data/$dir ~/$dir
      fi
    else
      cp -sTf /mnt/Data/$dir ~/$dir
    fi
  fi
done
if ! test -L ~/Music; then
  if ! rmdir ~/$dir &>/dev/null; then
    if mv -t '/mnt/Data/Songs/Audio Songs/' ~/Music/*; then
      rmdir ~/Music
      cp -sTf '/mnt/Data/Songs/Audio Songs' ~/Music
    fi
  else
    cp -sTf '/mnt/Data/Songs/Audio Songs' ~/Music
  fi
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
