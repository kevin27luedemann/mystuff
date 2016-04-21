cd /proc/$(ps x | awk '/libflashplayer.so\ /{print $1}')/fd && ls -l | grep deleted 
