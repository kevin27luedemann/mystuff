#!/bin/bash

if [ "$HOSTNAME" = "AGC-kevin" ]; then
	xautolock -detectsleep -time 5 -locker "$HOME/.i3/lock.sh"
fi
