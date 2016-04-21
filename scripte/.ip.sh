#holen der alten adresse und der neuen

adresseneu=`wget -qO- http://ipecho.net/plain`
adresse=`cat /home/pi/.log.ip 2> /dev/null`

#sollte das holen fehlschalgen wird eine dummy adresse gesetzt
if [ $? -ne 0 ] 
then
adresse="0.0.0.0"
fi

#verlgiehc der adressen ueber strings
if [ "$adresseneu" != "$adresse" ]
then
#speichern der neuen adresse
echo $adresseneu > /home/pi/.log.ip
#bekanntgeben der neuen adresse uber das mail protokoll
echo $adresseneu | mail -s "neue IP des Server" kevin27luedemann@gmail.com
#echo "ist nicht gleich"
fi
