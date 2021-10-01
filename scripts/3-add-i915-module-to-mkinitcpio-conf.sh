#!/bin/bash
if [ -f /etc/mkinitcpio.conf ]; then
  echo "Adding MODULES i915 in /etc/mkinitcpio.conf ..."
  eval $(grep -E '^[[:space:]]*MODULES=' /etc/mkinitcpio.conf)
  if declare -p MODULES &>/dev/null; then
    for module in ${MODULES[@]}
    do
      modules=($modules $module)
      [ $module = i915 ] && found=true
    done
    [ "$found" != true ] &&  modules=($modules i915)
    sudo sed -E "/^[[:space:]]*MODULES=/c MODULES=(${modules[*]})" -i /etc/mkinitcpio.conf
  else
    echo "MODULES=(i915)" | sudo tee -a /etc/mkinitcpio.conf >/dev/null
  fi
fi
