function cdg
  if test -n "$argv"
    cd /mnt/Data/gitapps/$argv
  else
    cd /mnt/Data/gitapps
  end
end
