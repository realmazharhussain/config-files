function chmod --description "chmod with automatic sudo when needed"
  if ! command chmod $argv 2>/dev/null
    sudo chmod $argv
  end
end
