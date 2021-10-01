#!/bin/bash
echo "Restoring SSH keys ..."
cp -dfrT /mnt/Data/.ssh $HOME/.ssh
sudo chown $USER: -R $HOME/.ssh
sudo chmod 700 $HOME/.ssh
sudo chmod 600 -R $HOME/.ssh/*
