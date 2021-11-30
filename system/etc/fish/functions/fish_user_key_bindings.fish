function fish_user_key_bindings
  set -l mode insert

  fish_default_key_bindings -M $mode

  # Control key bindings
  bind -M $mode \e\[1\;5D  backward-bigword         # Ctrl+⬅️
  bind -M $mode \e\[1\;5C  forward-bigword          # Ctrl+➡️
  bind -M $mode \b         backward-kill-bigword    # Ctrl+Backspace
  bind -M $mode \e\[3\;5~  kill-bigword             # Ctrl+Delete
  # Alternate key bindings
  bind -M $mode \e\[1\;3D  backward-word            # Alt+⬅️
  bind -M $mode \e\[1\;3C  forward-word             # Alt+➡️
  bind -M $mode \e\x7F     backward-kill-word       # Alt+Backspace
  bind -M $mode \e\[3\;3~  kill-word                # Alt+Delete
  # Disabled
  #bind -M $mode \cR        history-search-backward  # Ctrl+r
  #bind -M $mode \er        history-search-forward   # Alt+r

  fish_vi_key_bindings --no-erase $mode
end
