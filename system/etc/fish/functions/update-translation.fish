function update-translation
  for lang in $argv
    if test -f po/$lang.po
      begin
        set_color -o green
        echo -n 'INFO: '
        set_color normal
        echo -n "updating translation file for '"
        set_color -o blue
        echo -n $lang
        set_color normal
        echo \'
      end >&2
      cd po
      intltool-update $lang
      cd -
    else
      begin
        set_color -o yellow
        echo -n 'WARNING: '
        set_color normal
        echo "translation file for language '$lang' doesn't exist"
      end >&2
    end
  end
end
