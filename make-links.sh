#!/bin/bash
[ "$UID" = 0 ] && echo "Don't run me as root! I will call sudo myself whenever needed." >&2 && exit 1
scriptDir="$(dirname "$0")"
mkdir -p "$scriptDir"/system/etc/{samba,gdm-tools,UPower,profile.d}
mkdir -p "$scriptDir"/system/usr/share/libalpm/{scripts,hooks}
sudo cp -lf /etc/vimrc "$scriptDir"/system/etc/
sudo cp -lf /etc/environment "$scriptDir"/system/etc/
sudo cp -lf /etc/samba/smb.conf "$scriptDir"/system/etc/samba/
sudo cp -lf /etc/fstab "$scriptDir"/system/etc/fstab.example
sudo cp -lf /etc/gdm-tools/{custom.css,current{Background,Theme}} "$scriptDir"/system/etc/gdm-tools/
sudo cp -lf /etc/UPower/UPower.conf "$scriptDir"/system/etc/UPower/
sudo cp -lf /etc/profile.d/scripts-path.sh "$scriptDir"/system/etc/profile.d/
sudo cp -lf /usr/share/libalpm/hooks/extract-gdm-theme.hook "$scriptDir"/system/usr/share/libalpm/hooks/
sudo cp -lf /usr/share/libalpm/scripts/extract-gdm-theme "$scriptDir"/system/usr/share/libalpm/scripts/
mkdir -p "$scriptDir"/user/.local/share/applications
mkdir -p "$scriptDir"/user/.config/{Typora/typora-dictionaries,autostart}
mkdir -p "$scriptDir"/user/.xdman
cp -lf ~/.local/share/applications/freej2me.desktop "$scriptDir"/user/.local/share/applications/
cp -lf ~/.config/Typora/typora-dictionaries/user-dict.json "$scriptDir"/user/.config/Typora/typora-dictionaries/
cp -lf ~/.config/autostart/{wine.desktop,nemo-autostart.desktop} "$scriptDir"/user/.config/autostart/
cp -lf ~/.xdman/{config.txt,settings.json} "$scriptDir"/user/.xdman
cp -lf ~/{,{yay,pamac}-}aliases "$scriptDir"/user/
cp -df ~/pkg-aliases "$scriptDir"/user/
cp -lf ~/.gitconfig "$scriptDir"/user/
