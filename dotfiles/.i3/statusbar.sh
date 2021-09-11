#!/bin/bash
# shell script to prepend i3status with more stuff
i3status | while :
do
	read line
	volume=`amixer -M -c 0 get Master | grep "Mono: Playback"`
	volume=${volume#*[}
	volume=${volume%]*}
	volume=${volume%]*}
	volume=${volume%]*}
	#volume=${volume%[*}
	#volume=`echo ${now:30:3}`
	#echo "`mpc current` | vol: $volume | $line" || exit 1
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
