set gitapps_dir /mnt/Data/gitapps
set gitapps
for dir in (ls -A $gitapps_dir)
  if test -d $gitapps_dir/$dir; and not contains $dir AUR foreign
    set -a gitapps $dir
  end
end
for dir in (ls -A $gitapps_dir/AUR)
  if test -d $gitapps_dir/AUR/$dir
    set -a gitapps AUR/$dir
  end
end
for dir in (ls -A $gitapps_dir/foreign)
  if test -d $gitapps_dir/foreign/$dir
    set -a gitapps foreign/$dir
  end
end

complete -xk -c cdg -n "not __fish_seen_subcommand_from $gitapps" -a "$gitapps"
