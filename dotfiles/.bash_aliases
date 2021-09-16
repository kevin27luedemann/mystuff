#ls Befehle
alias ll='ls -l'
alias ls='ls --color=auto -v -h'
alias lla='ls -la'
alias la='ls -a'
alias lsd='~/.falsch.sh lsd'
alias ös='~/.falsch.sh ös'
alias lös='~/.falsch.sh lös'
alias öls='~/.falsch.sh öls'
alias lks='~/.falsch.sh lks'
alias ks='~/.falsch.sh ks'
alias kd='~/.falsch.sh kd'
alias kls='~/.falsch.sh kls'
alias lkd='~/.falsch.sh lkd'
alias löa='~/.falsch.sh löa'
alias lsb='xli `ls *.png`'
alias cp='cp -n'

#calender
alias ncal='ncal -C'

#sprung Befehle
alias ..='cd ..'
alias cd..='cd ..'
alias cd~='cd ~'
alias ~='cd ~'

#loesch Befehle
alias rm='rm -i'
alias rmf='rm -f'
alias rmort='rm -rf'

#Oberflaechenbefehle
alias lock='i3lock -i ~/Bilder/wallpaper_cip.png -c 000000'
alias weg='gnome-session-quit'

alias pushmpdtoserver='rsync -azv --progress /home/luedemann/.mpd/state luedemann@kevin-home-physik.de:/home/luedemann/.mpd/state'
alias pullmpdfromserver='rsync -azv --progress luedemann@kevin-home-physik.de:/home/luedemann/.mpd/state /home/luedemann/.mpd/state'
alias pushmpdtoserverlocal='rsync -azv --progress /home/luedemann/.mpd/state luedemann@192.168.2.119:/home/luedemann/.mpd/state'
alias pullmpdfromserverlocal='rsync -azv --progress luedemann@192.168.2.119:/home/luedemann/.mpd/state /home/luedemann/.mpd/state'

alias pushpokemontoserver='rsync -azv --update --progress /home/luedemann/Videos/pokemon/*.txt luedemann@kevin-home-physik.de:/home/luedemann/Videos/pokemon/'
alias pullpokemonfromserver='rsync -azv --update --progress luedemann@kevin-home-physik.de:/home/luedemann/Videos/pokemon/*.txt /home/luedemann/Videos/pokemon/'
alias pushpokemontoserverlocal='rsync -azv --update --progress /home/luedemann/Videos/pokemon/*.txt 192.168.2.119:/home/luedemann/Videos/pokemon/'
alias pullpokemonfromserverlocal='rsync -azv --update --progress 192.168.2.119:/home/luedemann/Videos/pokemon/*.txt /home/luedemann/Videos/pokemon/'

#ssh Befehle
alias sshcip='ssh -A kevin.luedemann@login.cip.physik.uni-goettingen.de'
alias sshcipx='ssh -X -A kevin.luedemann@login.cip.physik.uni-goettingen.de'
alias sshhpc='ssh -X -A kluedem@gwdu103.gwdg.de'
alias sshhome='ssh -X -A -C luedemann@kevin-home-physik.de'
alias sshhometunnel='ssh -X -A -L 127.0.0.1:2727:192.168.2.119:8888 luedemann@kevin-home-physik.de'
alias sshwork='ssh -X -A -C -J kluedem@gwdu60.gwdg.de,kevin@maurice.geo.physik.uni-goettingen.de kevin@geosoft'
alias vpnup='sudo nmcli connection up GWDG --ask'
alias vpndown='sudo nmcli connection down GWDG'

#befgehl zum brennen per bootloader
alias brenne="/home/luedemann/projekte/bootloader/lboot/bootloader -d /dev/ttyUSB0 -b 115200 -p"

alias vlc='vlc -q'

alias urserver_start='/opt/urserver/urserver-start'
alias urserver_stop='/opt/urserver/urserver-stop'

#alias playnext='python ~/_Puffer/pokemon/play_next'
function sshcuda { ssh -X cuda0"$1"; }
alias c1='ssh -X -A cuda01'
alias c2='ssh -X -A cuda02'
alias c3='ssh -X -A cuda03'
alias c4='ssh -X -A cuda04'
alias c5='ssh -X -A cuda05'
alias c7='ssh -X -A cuda07'
alias c8='ssh -X -A cuda08'
alias c9='ssh -X -A cuda09'
alias w6='ssh -X -A work06'
alias t1='ssh -X -A titan1'
alias t2='ssh -X -A titan2'
alias kevin='ssh -X -A kevin@kevin'
alias vogel='ssh -X -A kevin@vogel'


#ssh copy
alias syncdb='rsync -azv --update --progress $HOME/Documents/phd_results/database/ luedemann@kevin-home-physik.de:/home/luedemann/Documents/phd_results/database/'


alias soundwire='/home/luedemann/bin/SoundWireServer/SoundWireServer'

alias plot='python3 /home/luedemann/Documents/compconv/plots/plot.py -f'
alias anim='python3 /home/luedemann/Documents/compconv/plots/animate.py -f'

#Befehle zum plotten speziel auf geosoft
alias plot="python3 ~/Documents/compconv/plots/plot.py -f "
alias plot2dvar="python3 ~/Documents/compconv/plots/plot_2Dvar.py -f "
alias cmplot="python3 ~/Documents/compconv/plots/cmplot.py -f "
alias anim="python3 ~/Documents/compconv/plots/animate.py -f "
alias anim3d="python3 ~/Documents/compconv/plots/animate3D.py -f "
alias terms="python3 ~/Documents/compconv/plots/terms.py -f "
alias slize="python3 ~/Documents/compconv/plots/slizes.py -f "
alias corre="python3 ~/Documents/compconv/plots/correl.py -f "
alias momentum="python3 ~/Documents/compconv/plots/momentum.py -f "
alias running="screen -rx running"
alias running2="screen -rx running2"
alias running3="screen -rx running3"
alias running4="screen -rx running4"
alias running5="screen -rx running5"
alias running6="screen -rx running6"
alias running7="screen -rx running7"
alias running8="screen -rx running8"
alias r1="screen -rx running"
alias r2="screen -rx running2"
alias r3="screen -rx running3"
alias r4="screen -rx running4"
alias r5="screen -rx running5"
alias r6="screen -rx running6"
alias r7="screen -rx running7"
alias r8="screen -rx running8"
alias timeavg="python3 /home/upgp/kevin/Documents/phd_results/convergency/time_convergency.py -f"
alias db="time python3 /home/upgp/kevin/Documents/phd_results/database/db.py"
alias converg="python3 /home/upgp/kevin/Documents/phd_results/convergency/time_convergency.py -f"
alias all_nvsmi="python3 /home/upgp/kevin/bin/all_nvsmi.py"

#workhours
alias overtime='python3 /home/upgp/kevin/Documents/workhours/scripts/overtime.py'
alias watch='watch -d -c'

#Script Befehle
#watch SGE fuer meinen Account
alias sgew='~/.watchqge.sh'
#auslastung der rechner herausfinden
alias ccip='~/.ccip.sh'
#watch lpq als lpq definieren
alias lpwq='watch lpq'
alias lpqw='watch lpq'

#Befehle um das Binden von Strg-s zu verhindern zum speichern in Vim
bind -r '\C-s'
stty -ixon

#spassiege scripte
alias uhr='date | cowsay -f dragon'
alias uhrw='watch "date | cowsay -f dragon"'

#hexeditor in full version
alias hexedit='hexedit -s -m --color'

#print rules
alias regeln='/home/luedemann/.regeln.py'

#python cuda und api aliases
alias gpuse="python -c \"import pycurb.gputools as gu; gu.print_gpu_usage()\""
alias gpuse_watch="watch -n 20 -d -c \"python -c 'import pycurb.gputools as gu; gu.print_gpu_usage()'\""
alias gpuse_amount="python -c \"import pycurb.gputools as gu; gu.print_gpu_usage_amount(no_print=False)\""
alias simstatus="/home/upgp/kevin/bin/simstatus.sh"
alias auswertung="python3 /home/upgp/Geophysik/Piv/tools/helper/auswertung_later.py"
alias tiftojpg="python3 /home/upgp/Geophysik/Piv/tools/helper/tiftojpg.py"
alias tiftojpg_bg="python3 /home/upgp/Geophysik/Piv/tools/helper/tiftojpg_subbg.py"


alias nvvp='nvvp -vm /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java'

#Variable in der Bash setzen
export EDITOR=/usr/bin/vim

#Nek5000
export PATH=/home/luedemann/Nek5000/bin/:$PATH

#kitty
alias icat="kitty +kitten icat"
alias kssh="kitty +kitten ssh"
alias ksshcip='kitty +kitten ssh kevin.luedemann@login.cip.physik.uni-goettingen.de'
alias ksshcipx='kitty +kitten ssh -X kevin.luedemann@login.cip.physik.uni-goettingen.de'
alias ksshhpcvpn='kitty +kitten ssh -X -C kluedem@gwdu102.gwdg.de'
alias ksshhpc='kitty +kitten ssh -X -A -C -J kluedem@login.gwdg.de kluedem@gwdu102.gwdg.de'
alias ksshwork='kitty +kitten ssh -X -A -C -J kluedem@gwdu60.gwdg.de,kevin@maurice.geo.physik.uni-goettingen.de kevin@geosoft'


#Openfoam
FILE=/opt/openfoam-dev/etc/bashrc
if test -f "$FILE"; then
	. /opt/openfoam-dev/etc/bashrc
	. /opt/openfoam8/etc/bashrc
fi
