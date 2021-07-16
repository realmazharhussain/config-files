# config-files
My Configuration Files

# Important!

If for some ***dumb reason*** you want to run `./install.sh` script present in this git repo to install all my config files onto your system, Plz, make sure that the version of distro you are using first came out in 2021 or later (e.g. latest(up-to-date) version of Manjaro, Ubuntu 21.04, etc.). If you are using some older distro, ***I think*** running the `install.sh` script **will delete all the config files** already present on your system. Because, in my experience, for some ***even dumber reason***, older versions of the `cp` command thought `cp -rT newfolder oldfolder` meant "replace `oldfolder` with `newfolder` (equivalent to `rm -rf oldfolder; cp -rT newfolder oldfolder`)"

#### OR

Maybe **It was me** who did something ***really dumb*** like copying a directory-symlink as a directory without the -L flag i.e. running `cp -rT symlink directory` instead of `cp -rLT symlink directory` **AND** the `cp` command worked the same on those older distros as well **AND** I am just blaming `cp` for ***my shit***.

***Who knows?***



> # It is better to be safe than sorry, right?

