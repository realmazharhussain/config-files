#!/bin/bash
echo "Installing appimaged ..."
sudo ln -sfT /mnt/Data/Apps+/Linux/AppImages/installed /Applications
sudo ln -sfT /mnt/Data/Apps+/Linux/AppImages/appimaged.AppImage /usr/bin/appimaged
#sudo ln -sft /etc/xdg/autostart/ /mnt/Data/Apps+/Linux/AppImages/autostart/appimagekit-appimaged.desktop
sudo ln -sft /etc/systemd/user/ /mnt/Data/Apps+/Linux/AppImages/systemd/user/appimaged.service
echo "Enabling/Starting appimaged.service ..."
systemctl --user enable --now appimaged.service
