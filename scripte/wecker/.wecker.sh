#eingabe in Minuten
Mi=`echo $1%60 | bc -q`
St=`echo $1/60 | bc -q`
#echo $St:$Mi
NM=`date +%M`
NS=`date +%H`
#echo $NS:$NM
WMt=`echo $NM+$Mi | bc -q`
WM=`echo $WMt%60 | bc -q`
WSt=`echo $NS+$St+$WMt/60 | bc -q`
WS=`echo $WSt%24 | bc -q`
#echo $WS:$WM

#ubergabe der neuen Zeiten in ein neuen crontab
crontab -l > /tmp/outcron.txt
echo "$WM $WS * * * /home/luedemann/.we.sh" >> /tmp/outcron.txt
crontab /tmp/outcron.txt
rm -f /tmp/putcron.txt
