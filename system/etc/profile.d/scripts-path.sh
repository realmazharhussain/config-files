for dir in $HOME{/gitapps,}/scripts; do
   [ -d "$dir" ] && export PATH="$dir:$PATH" && break
done
