#!/bin/bash
if [ "$HOSTNAME" = "framework" ]; then
	amixer -M -c 0 set Speaker 100% unmute
	amixer -M -c 0 set PCM 100% unmute
	amixer -M -c 0 set Master playback toggle
elif [ "$HOSTNAME" = "geosoft" ]; then
	amixer -M -c 0 set Speaker 100% unmute
	amixer -M -c 0 set PCM 100% unmute
	amixer -M -c 0 set Master playback toggle
else
	amixer -M -c 1 set Front playback unmute
	amixer -M -c 1 set Line playback unmute
	amixer -M -c 1 set Surround playback unmute
	amixer -M -c 1 set Center playback unmute
	amixer -M -c 1 set LFE playback unmute
	amixer -M -c 1 set Headphone 100% unmute
	amixer -M -c 1 set Master playback toggle
fi
