#!/bin/bash
[ "$USER" = root ] && echo "Don't run me as root. I will run sudo myself." >&2 && exit 1
scriptDir="$(dirname "$0")"

echo "Copying files ..."
cp -rT "$scriptDir"/user "$HOME"
sudo cp -rT "$scriptDir"/system /

echo "Rewriting /etc/fstab ..."
sudo cp -n /etc/fstab{,.original}

for name in '\/' '\/boot\/efi' swap
do
  line="$(grep -E "[[:space:]]$name[[:space:]]" /etc/fstab)"
  line="${line/\//\\\/}"
  sudo sed -E "/[[:space:]]$name[[:space:]]/c $line" -i /etc/fstab.example
done
sudo mv /etc/fstab{.example,}

if [ -f /etc/makepkg.conf ]; then
  echo "Changing PACKAGER name in /etc/makepkg.conf ..."
  sudo sed -E '/PACKAGER=/c PACKAGER="Mazhar Hussain <mmazharhussainkgb1145@gmail.com>"' -i /etc/makepkg.conf
fi

if [ -f /etc/mkinitcpio.conf ]; then
  echo "Adding MODULES i915 in /etc/mkinitcpio.conf ..."
  eval $(grep -E '^[[:space:]]*MODULES=' /etc/mkinitcpio.conf)
  if declare -p MODULES &>/dev/null; then
    for module in ${MODULES[@]}
    do
      modules=($modules $module)
      [ $module = i915 ] && found=true
    done
    [ "$found" != true ] &&  modules=($modules i915)
    sudo sed -E "/^[[:space:]]*MODULES=/c MODULES=(${modules[*]})" -i /etc/mkinitcpio.conf
  else
    echo "MODULES=(i915)" | sudo tee -a /etc/mkinitcpio.conf >/dev/null
  fi
fi

echo "Seems config-files have been installed! Now, hope that the system didn't 'sudo rm -rf /' itself."
