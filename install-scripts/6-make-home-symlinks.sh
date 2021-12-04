#!/bin/bash
make-symlink() {
  source="$1"
  target="$2"
  if test -e "$target" &&\
     test -d "$target" &&\
     test -n "$(find "$target" -type f)" &&\
     ! mv -i "$target"/* "$source"/; then
    abort=yes
  fi
  if test -z "$abort"; then
     if test -f "$target" || test -L "$target"; then
       rm "$target"
     elif test -d "$target"; then
       rmdir "$target"
     fi
     ln -sTf "$source" "$target"
  fi
}
make-home-symlinks(){
for dir in Documents Downloads Pictures Templates Videos Music:"Songs/Audio Songs"; do
   source="/mnt/Data/${dir#*:}"
   target="$HOME/${dir%:*}"
   make-symlink "$source" "$target"
done
}

echo "Making symlinks in HOME directory ..."
make-home-symlinks
