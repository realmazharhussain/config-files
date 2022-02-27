function mkcd --description "mkdir and then cd"
  if [ (count $argv) -eq 1 ]
    mkdir -p "$argv"
    cd "$argv"
  else if [ (count $argv) -gt 1 ]
    for dirName in $argv
      set dirNames $dirNames (realpath -m "$dirName")
    end
    for dirName in $dirNames
      mkdir -p "$dirName"
      pushd "$dirName"
    end
  else
    echo "nothing to do"
  end
end
