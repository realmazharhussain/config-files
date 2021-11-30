# Put system-wide fish configuration entries here
# or in .fish files in conf.d/
# Files in conf.d can be overridden by the user
# by files with the same name in $XDG_CONFIG_HOME/fish/conf.d

# This file is run by all fish instances.

# Only for login shells
#if status is-login
#  set tempDir (mktemp -d)
#  
#  sh -l -c env > $tempDir/tempfile
#  
#  for envFile in /etc/environment /etc/environment.d/*
#    cat $envFile >> $tempDir/tempfile
#  end
#
#  for line in (cat $tempDir/tempfile)
#    if echo $line | grep -vE ' *#' > /dev/null
#      set name (echo $line | cut -d '=' -f 1)
#      eval set value (echo $line | cut -d '=' -f 2)
#      if echo $name | grep -E 'PATH$' >/dev/null
#        set value (echo $value | sed 's/:/\n/g')
#      end
#      if ! contains $name PWD SHLVL _ ''
#        set -g -x $name $value
#        echo "'$name'" "'$value'"
#      end
#    end
#  end
#
#  rm -rf $tempDir
#  set -e tempDir
#  set -e envFile
#  set -e line
#  set -e name
#  set -e value
#end

# Only for interactive sessions
if status is-interactive
  set -gx fish_greeting
  for functionFile in  {/etc,$HOME/.config}/fish/fish_functions/*.fish
    source $functionFile
  end
  [ -f /usr/share/autojump/autojump.fish ] && source /usr/share/autojump/autojump.fish
  [ -f ~/aliases ] && source ~/aliases
  # Colorize 'less' program
  set -gx LESS '-R'
  set -gx LESS_TERMCAP_mb (set_color brred)
  set -gx LESS_TERMCAP_md (set_color brred)
  set -gx LESS_TERMCAP_me (set_color normal)
  set -gx LESS_TERMCAP_se (set_color normal)
  set -gx LESS_TERMCAP_so (set_color -o brblue; set_color -b white)
  set -gx LESS_TERMCAP_ue (set_color normal)
  set -gx LESS_TERMCAP_us (set_color green)
  # Include PWD in PATH
  set PATH $PATH .
  # Set the right cursors for vim mode
  set fish_cursor_default block blink
  set fish_cursor_unknown line blink
  set fish_cursor_insert line blink
  set fish_cursor_replace_one underscore blink
  set fish_cursor_visual block
end
