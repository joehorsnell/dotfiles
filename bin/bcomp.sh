#!/bin/sh

# Where you keep CrossOver
crossover="/Applications/CrossOver.app"
bottle="Beyond Compare"
exe_dir="Beyond Compare 3"
exe_name="BCompare.exe"

open "$crossover"

export DISPLAY=:`defaults read com.codeweavers.CrossOver Display`
export DYLD_FALLBACK_LIBRARY_PATH="$crossover/Contents/SharedSupport/X11/lib:$HOME/lib:/lib:/usr/lib:/usr/X11/lib"
export FONT_ENCODINGS_DIRECTORY="$crossover/Contents/SharedSupport/X11/lib/X11/fonts/encodings/encodings.dir"
export FONTCONFIG_PATH="$crossover/Contents/SharedSupport/X11/etc/fonts"
export FONTCONFIG_ROOT="$crossover/Contents/SharedSupport/X11"
export VERSIONER_PERL_PREFER_32_BIT=yes
export CX_BOTTLE="$bottle"
export PATH="$crossover/Contents/SharedSupport/CrossOver/bin:$PATH"

# Uncomment this if you need to be in the bottle's C: drive directory
#cd "$HOME/Library/Application Support/CrossOver/Bottles/$bottle/drive_c/Program Files/$exe_dir"
full_exe_path="$HOME/Library/Application Support/CrossOver/Bottles/$bottle/drive_c/Program Files/${exe_dir}/${exe_name}"

# This picks up the wine binary from newly modified PATH
wine ${full_exe_path} $@
