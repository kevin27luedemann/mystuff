#!/bin/bash
revert(){
    xset dpms 0 0 0
}
trap revert HUP INT TERM
xset +dpms dpms 5 5 5
i3lock -n -t -i $HOME/.wallpaper_logo_saver.png -k --timecolor=D50000 --datecolor=000080 --timepos="100:50" --datestr="%A %d.%m.%Y"
revert
