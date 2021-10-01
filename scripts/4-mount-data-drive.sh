#!/bin/bash
echo "Mounting /mnt/Data ..."
if ! { mount | grep '/mnt/Data' &>/dev/null; }; then
 sudo mkdir -p /mnt/Data && sudo mount LABEL=Data /mnt/Data
fi
