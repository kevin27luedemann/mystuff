#!/bin/bash

if [ "$HOSTNAME" = "kevin-Latitude-7420" ]; then
	xautolock -detectsleep -time 15 -locker "$HOME/.i3/lock.sh b"
fi
