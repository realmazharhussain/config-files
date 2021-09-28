if status is-interactive
  which fastfetch &>/dev/null && fastfetch
  set PATH . $PATH
end
