#ls Befehle
alias ll='ls -l'
alias ls='ls --color=auto -v -h'
alias lla='ls -la'
alias la='ls -a'
alias cp='cp -n'

#sprung Befehle
alias ..='cd ..'
alias cd..='cd ..'
alias cd~='cd ~'
alias ~='cd ~'

#loesch Befehle
alias rm='rm -i'
alias rmf='rm -f'

#Oberflaechenbefehle
alias lock='i3lock -i ~/Bilder/wallpaper_cip.png -c 000000'

alias rsync1m='rsync --bwlimit=1M --progress'

#ssh Befehle
alias sshhpc='ssh -X -A kluedem1@login-mdc.hpc.gwdg.de'
alias sshhpcj='ssh -X -A -J kluedem1@login.gwdg.de kluedem1@login-mdc.hpc.gwdg.de'
alias sshhome='ssh -X -A -C luedemann@kevin-home-physik.de'
alias sshhometunnel='ssh -X -A -L 127.0.0.1:2727:192.168.2.180:8888 luedemann@kevin-home-physik.de'

#befgehl zum brennen per bootloader
alias brenne="/home/luedemann/projekte/bootloader/lboot/bootloader -d /dev/ttyUSB0 -b 115200 -p"

function r {
if ! screen -list | grep -q "running$1"
then
	screen -S running$1
else
	screen -rx running$1
fi

}

#Befehle um das Binden von Strg-s zu verhindern zum speichern in Vim
bind -r '\C-s'
stty -ixon

#print rules
alias regeln='/home/luedemann/.regeln.py'

alias nvvp='nvvp -vm /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java'

#Variable in der Bash setzen
export EDITOR=/usr/bin/vim

#Nek5000
export PATH=$HOME/Nek5000/bin/:$PATH

#Local bin
export PATH=$HOME/.local/bin:$PATH

#kitty
#kitten ssh
alias kssh="kitty +kitten ssh"

alias ksshhome='kitty +kitten ssh -X -A -C luedemann@kevin-home-physik.de'
alias ksshhometunnel='kitty +kitten ssh -X -A -L 127.0.0.1:2727:192.168.2.180:8888 luedemann@kevin-home-physik.de'

#kitten icat
alias icat="kitty +kitten icat"

#kitten transfer
alias transfer="kitty +kitten transfer"

#kitty matplotlib variable
export MPLBACKEND_KITTY_SIZING="manual"

#Get kitty update
alias get_Kitty="curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin"

#Openfoam
FILE=/opt/openfoam-dev/etc/bashrc
if test -f "$FILE"; then
	. /opt/openfoam-dev/etc/bashrc
	. /opt/openfoam9/etc/bashrc
fi
