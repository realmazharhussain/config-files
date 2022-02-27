set gitapps_dir /mnt/Data/gitapps
set gitapps
for dir in $gitapps_dir/{,AUR,foreign}/*
  if test -r $dir/.git
    set -a gitapps (string replace $gitapps_dir/ '' $dir)
  end
end

complete -xk -c gitapp -n "not __fish_seen_subcommand_from $gitapps" -a "$gitapps"
