#!/bin/bash
export repo_root="$(dirname "$0")"
cd "$repo_root"

# run scripts
for script in ./install-scripts/*; do
   chmod 755 "$script"
   "$script"
done

# Success message
echo "Seems config-files have been installed! Now, hope that the system didn't 'sudo rm -rf /' itself."
