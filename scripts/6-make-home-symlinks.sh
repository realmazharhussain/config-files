#!/bin/bash
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

echo "Making symlinks in HOME directory ..."
make-home-symlinks
