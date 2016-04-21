#variante des Loginservers
login=`/usr/bin/ruptime -l -r | grep -E "c[0-9]{3}.*" | grep "up" | /usr/bin/head -n 10`
#variante fuer laengste laufzeit waehle nur 10
laufzeit=`/usr/bin/ruptime -t | grep -E "c[0-9]{3}.*" | /usr/bin/head -n 10`
#variante fuer kuerzeste Laufzeit
frisch=`/usr/bin/ruptime -t -r | grep -E "c[0-9]{3}.*" | grep "up" | /usr/bin/head -n 10`
#variante fuer rechner, die down sind
down=`/usr/bin/ruptime -t -r | grep -E "c[0-9]{3}.*" | grep "down"`

if [ "$1" == 'l' ] || [ $# -eq 0 ]
then
echo "Wenigste auslastung:"
echo -e "$login\n"
fi

if [ "$1" == 'r' ] && [ $# -ne 0 ] 
then
echo "Die Urgestirne im CIP sind:"
echo -e "$laufzeit\n"
fi

if [ "$1" == 'f' ] && [ $# -ne 0 ]
then
echo "Die frischesten Rechner sind:"
echo -e "$frisch\n"
fi

if [ "$1" == 'd' ] && [ $# -ne  0 ]
then
echo "Die Rechner mit marker 'down' sind:"
echo -e "$down\n"
fi
