#!/bin/bash
export repo_root="$(dirname "$0")"
cd "$repo_root"

# run scripts
for script in ./install-scripts/*; do
   if [[ -x "$script" && "$script" != *.bak ]]; then
     "$script" || { echo "script '$script' failed! quitting..."; exit 1; }
   fi
done

# Success message
echo "Seems config-files have been installed! Now, hope that the system didn't 'sudo rm -rf /' itself."
