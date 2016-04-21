ls --color
fehler=`date`'\t'$1
echo -e $fehler >> ~/.lsd.log
#if [ -z "$1" ];
#then
#echo "no arg";
#else
#echo "arg";
#fi
#echo -e $fehler | mail -s "Fehler" kevin27luedemann@googlemail.com
