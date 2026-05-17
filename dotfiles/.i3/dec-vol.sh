#!/bin/bash
if [ "$HOSTNAME" = "framework" ]; then
	amixer -c 0 set Master 2%-
elif [ "$HOSTNAME" = "AGC-kevin" ]; then
	amixer set Master 2%-
else
	amixer -c 1 set Master 2%-
fi

