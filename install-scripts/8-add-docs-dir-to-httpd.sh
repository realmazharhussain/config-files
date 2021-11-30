#!/bin/bash
config_file=/etc/httpd/conf/httpd.conf
include_line='Include conf/extra/myconfig.conf'
if [ -f $config_file ]; then
  echo "adding /docs directory to httpd.conf ..."
  if ! grep "$include_line" $config_file &>/dev/null; then
     echo "$include_line" | sudo tee -a $config_file >/dev/null
  fi
fi
