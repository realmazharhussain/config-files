for dir in /mnt/Data/gitapps/scripts $HOME{/gitapps,}/scripts; do
   [ -d "$dir" ] && export PATH="$dir:$PATH" && break
done
