#!/bin/bash
[ "$UID" = 0 ] && echo "Don't run me as root! I will call sudo myself whenever needed." >&2 && exit 1
script_dir="$(dirname "$0")"
cd "$script_dir"
source filemap
sync_files(){
  if test ! -v orig_dir
  then
    echo '$orig_dir not specified! not syncing files.' >&2
    return 1
  fi
  if test ! -v bak_dir
  then
    echo '$bak_dir not specified! not syncing files.' >&2
    return 1
  fi
  for file in "$@"
  do
    file_orig="$orig_dir/${file%=*}"
    file_bak="$bak_dir/${file#*=}"
    echo $file_orig '->' $file_bak
    mkdir -p "$(dirname "$file_bak")"
    $sudo cp -dfrpT "$file_orig" "$file_bak"
    if test -d "$file_orig"
    then
      filenames=()
      while read filename
      do
         filenames+=("$filename")
      done <<< "$(find "$file_bak" -printf '%P\n')"
      for filename in "${filenames[@]}"; do
        if test ! -e "$file_orig"/"$filename"; then
           echo -n "remove '$file_bak/$filename'? "
           if test -d "$file_bak"/"$filename"; then
             $sudo rm -rI "$file_bak"/"$filename" 2>/dev/null
           else
             $sudo rm -i "$file_bak"/"$filename" 2>/dev/null
           fi
        fi
      done
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

backup_ssh_keys(){
  echo 'Backing up SSH keys ...'
  cp -dfrpT $HOME/.ssh /mnt/Data/.ssh
  while read filename
  do
    test ! -e $HOME/.ssh/"$filename" && rm -i /mnt/Data/.ssh/"$filename"
  done <<< "$(find /mnt/Data/.ssh -printf '%P\n')"
}

orig_dir=$HOME bak_dir="$script_dir"/user             sync_files "${home_files[@]}"
orig_dir=''    bak_dir="$script_dir"/system sudo=sudo sync_files "${root_files[@]}"
sudo chown $USER -R system
remove_excluded_files
backup_ssh_keys
exit 0
