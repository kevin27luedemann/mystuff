mpg123 -q /home/luedemann/.bell.mp3
crontab -l | grep -v .we.sh > /home/luedemann/.outcron.txt
crontab /home/luedemann/.outcron.txt
rm -f /home/luedemann/.outcron.txt
