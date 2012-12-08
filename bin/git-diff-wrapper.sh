#!/bin/sh
# diff is called by git with 7 parameters:
# path old-file old-hex old-mode new-file new-hex new-mode
/opt/local/bin/wine ~joe/apps/Beyond\ Compare\ 3/BCompare.exe "$2" "$5" | cat