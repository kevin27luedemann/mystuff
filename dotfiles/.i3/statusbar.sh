#!/bin/bash
# shell script to prepend i3status with more stuff
i3status | while :
do
	read line
	
	if [ "$HOSTNAME" == "nuknuk" ]; then
		volume=`amixer -M -c 0 get Master | grep "Left:"`
		volume=${volume#*[}
		volume=${volume%]*}
		volume=${volume%]*}
		volume=${volume%]*}
	elif [ "$HOSTNAME" == "airbrain" ]; then
		volume=`amixer -M -c 0 get Master | grep "Mono: Playback"`
		volume=${volume#*[}
		volume=${volume%]*}
		volume=${volume%]*}
		volume=${volume%]*}
	else
		volume=`amixer -M -c 1 get Master | grep "Mono: Playback"`
		volume=${volume#*[}
		volume=${volume%]*}
		volume=${volume%]*}
		volume=${volume%]*}
	fi
	percent=`mpc status | grep "([0-9]"`
	if [ ! -z "$percent" ]
	then
		percent="(${percent#*(} |"
	fi
	#echo "`mpc current` $percent vol: $volume | $line" || exit 1
	echo "$percent vol: $volume | $line" || exit 1
	#use the spotifycli client
	#echo "`spotifycli --playbackstatus` `spotifycli --status` | vol: $volume | $line" || exit 1
done
