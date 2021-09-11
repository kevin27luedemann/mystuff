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
alias lock='xscreensaver-command -lock'
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
alias sshcip='ssh -C kevin.luedemann@login.cip.physik.uni-goettingen.de'
alias sshcipx='ssh -X -C kevin.luedemann@login.cip.physik.uni-goettingen.de'
alias sshhpc='ssh -X -C kluedem@gwdu103.gwdg.de'
alias sshhome='ssh -X -A -C luedemann@kevin-home-physik.de'
alias sshhometunnel='ssh -X -A -L 127.0.0.1:2727:192.168.2.119:8888 luedemann@kevin-home-physik.de'
alias sshwork='ssh -X -C -J kluedem@gwdu60.gwdg.de,kevin@maurice.geo.physik.uni-goettingen.de kevin@geosoft'
alias vpnup='sudo nmcli connection up GWDG --ask'
alias vpndown='sudo nmcli connection down GWDG'

#befgehl zum brennen per bootloader
alias brenne="/home/luedemann/projekte/bootloader/lboot/bootloader -d /dev/ttyUSB0 -b 115200 -p"

alias vlc='vlc -q'

alias urserver_start='/opt/urserver/urserver-start'
alias urserver_stop='/opt/urserver/urserver-stop'

#alias playnext='python ~/_Puffer/pokemon/play_next'

alias soundwire='/home/luedemann/bin/SoundWireServer/SoundWireServer'

alias plot='python3 /home/luedemann/Documents/compconv/plots/plot.py -f'
alias anim='python3 /home/luedemann/Documents/compconv/plots/animate.py -f'

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
