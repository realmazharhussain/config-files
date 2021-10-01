#!/bin/bash
if [ -f /etc/makepkg.conf ]; then
  echo "Changing PACKAGER name in /etc/makepkg.conf ..."
  sudo sed -E '/PACKAGER=/c PACKAGER="Mazhar Hussain <mmazharhussainkgb1145@gmail.com>"' -i /etc/makepkg.conf
fi
