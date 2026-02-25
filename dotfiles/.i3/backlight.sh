#!/bin/bash
if [ "$HOSTNAME" = "airbrain" ]; then
	if [ "$1" = "dec" ]; then
		xbacklight -dec $2
	elif [ "$1" = "inc" ]; then
		xbacklight -inc $2
	fi
elif [ "$HOSTNAME" = "framework" ]; then
	if [ "$1" = "dec" ]; then
		light -U $2
	elif [ "$1" = "inc" ]; then
		light -A $2
	fi
elif [ "$HOSTNAME" = "AGC-kevin" ]; then
	if [ "$1" = "dec" ]; then
		light -U $2
	elif [ "$1" = "inc" ]; then
		light -A $2
	fi
fi
