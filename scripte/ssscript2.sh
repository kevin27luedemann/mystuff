#!/bin/sh -e

# Take a screenshot
import -window root ~/.screen_locked.png

# Pixellate it 10x
mogrify -scale 20% -scale 500% ~/.screen_locked.png

# Lock screen displaying this image.
i3lock -i ~/.screen_locked.png

# Turn the screen off after a delay.
sleep 60; pgrep i3lock && xset dpms force off
