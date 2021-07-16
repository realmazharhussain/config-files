#!/bin/bash
[ "$UID" = 0 ] && echo "Don't run me as root! I will call sudo myself whenever needed." >&2 && exit 1
scriptDir="$(dirname "$0")"
sudo cp -lf /etc/vimrc "$scriptDir"/system/etc/
sudo cp -lf /etc/samba/smb.conf "$scriptDir"/system/etc/samba/
sudo cp -lf /etc/fstab "$scriptDir"/system/etc/fstab.example
sudo cp -lf /etc/gdm-tools/{custom.css,current{Background,Theme}} "$scriptDir"/system/etc/gdm-tools/
sudo cp -lf /etc/UPower/UPower.conf "$scriptDir"/system/etc/UPower/
cp -lf ~/.local/share/applications/freej2me.desktop "$scriptDir"/user/.local/share/applications/
cp -lf ~/.config/Typora/typora-dictionaries/user-dict.json "$scriptDir"/user/.config/Typora/typora-dictionaries/
cp -lf ~/.config/autostart/{wine.desktop,nemo-autostart.desktop} "$scriptDir"/user/.config/autostart/
cp -lf ~/{,{yay,pkg,pamac}-}aliases "$scriptDir"/user/
cp -lf ~/.gitconfig "$scriptDir"/user/
