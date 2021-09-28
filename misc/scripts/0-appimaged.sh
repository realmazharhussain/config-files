#!/bin/bash
sudo ln -sfT /mnt/Data/Apps+/Linux/AppImages/installed /Applications
sudo ln -sfT /mnt/Data/Apps+/Linux/AppImages/appimaged.AppImage /usr/local/bin/appimaged
sudo ln -sft /etc/xdg/autostart/ /mnt/Data/Apps+/Linux/AppImages/autostart/appimagekit-appimaged.desktop
