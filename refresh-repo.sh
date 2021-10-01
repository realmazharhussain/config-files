#!/bin/bash
[ "$UID" = 0 ] && echo "Don't run me as root! I will call sudo myself whenever needed." >&2 && exit 1
script_dir="$(dirname "$0")"
cd "$script_dir"
source filemap
sync_files(){
  for file in "$@"
  do
    file_orig="$orig_dir"/${file%=*}
    file_bak="$bak_dir"/${file#*=}
    echo $file_orig '->' $file_bak
    mkdir -p "$(dirname "$file_bak")"
    $sudo cp -dfrpT "$file_orig" "$file_bak"
    #install -DT "$file_orig" "$file_bak"
    if test -d "$file_orig"
    then
      while read filename
      do
        test ! -e "$file_orig"/"$filename" && rm -i "$file_bak"/"$filename"
      done <<< "$(find "$file_bak" -printf '%P\n')"
    fi
  done
}
remove_excluded_files(){
  if test ${#exclude_files[@]} -gt 0
  then
    echo removing excluded files ...
    rm -rf "${exclude_files[@]}"
  fi
}

orig_dir=$HOME bak_dir="$script_dir"/user             sync_files "${home_files[@]}"
orig_dir=''    bak_dir="$script_dir"/system sudo=sudo sync_files "${root_files[@]}"
remove_excluded_files
sudo chown $USER -R system
