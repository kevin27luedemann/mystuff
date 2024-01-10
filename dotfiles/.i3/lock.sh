#!/bin/bash
revert(){
    xset dpms 0 0 0
}
#Activate screen blanking for energy saving
if [ "$1" = "b" ] || [ "$1" = "h" ]
then
    trap revert HUP INT TERM
    xset +dpms dpms 5 5 5
fi

#Suspend the device to RAM to further save energy
if [ "$1" = "h" ]
then
    systemctl suspend
fi
#i3lock -n -t -i $HOME/.wallpaper_logo_saver.png -k --timecolor=D50000 --datecolor=000080 --timepos="100:50" --datestr="%A %d.%m.%Y"
#i3lock -n -t -i $HOME/.wallpaper_logo_saver.png # -k --timecolor=D50000 --datecolor=000080 --timepos="100:50" --datestr="%A %d.%m.%Y"
i3lock -n -c D50000
revert
