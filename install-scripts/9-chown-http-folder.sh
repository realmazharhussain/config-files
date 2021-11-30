#!/bin/bash
user=$(logname)
dir=/srv/http/mazhar
echo "Change ownership of $dir to $user ..."
sudo chown $user: -R $dir
