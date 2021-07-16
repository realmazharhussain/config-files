#!/bin/bash
[ "$USER" = root ] && echo "Don't run me as root. I will run sudo myself." && exit 1
scriptDir="$(dirname "$0")"
echo "Copying files ..."
cp -rT "$scriptDir"/user "$HOME"
sudo cp -rT "$scriptDir"/system /
echo "Seems config-files have been installed! Now, hope the system didn't 'sudo rm -rf /' itself."
