#!/bin/bash
#pruefen, ob eigabe des Users richtig
if [ "$1" != ""  ]
then
#zuerst updates installieren
cp ./sources.list /etc/apt/
apt-get update
apt-get upgrade -y
#erste handvoll wichtige programme
apt-get install -y okular filezilla ncdu cowsay fortune mc feh ImageMagick arandr gcc xterm ranger hexedit i3 i3blocks pkg-config gtk+-2.0 gtk+-3.0 mpc mpd htop xterm xli xosview avrdude avrdude-doc cmake
#vim mit latex installieren
apt-get install -y vim-gtk vim
#google chrome installieren
apt-get install -y chromium
#install python
apt-get install -y python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose
#install nvidia driver und konfigurieren
if [ "$2" == "nvidia" ] || [ "$3" == "nvidia" ] || [ "$4" == "nvidia" ]
then
	apt-get install -y nvidia-driver nvidia-xconfig
	apt-get install -y xorg-server-source
	nvidia-xconfig
	apt-get install -y nvidia-cuda-dev nvidia-cuda-toolkit nvidia-cuda-doc nvidia-cuda-mps
fi
#install texlive
if [ "$2" == "texlive" ] || [ "$3" == "texlive" ] || [ "$4" == "texlive" ]
then
	apt-get install -y texlive-full
fi
#get vim bundel manager vundle
git clone https://github.com/gmarik/Vundle.vim.git /home/$1/.vim/bundle/Vundle.vim

#add Resource Datai fuer xterminal
cp ../bashinit/.Xresources /home/$1/
chmod 776 /home/$1/.Xresources
cp ../bashinit/.Xdefaults /home/$1/
chmod 776 /home/$1/.Xdefaults
#i3 einstellen
cp ../i3/wallpaper.jpg /home/$1/Bilder/
chmod 776 /home/$1/Bilder/wallpaper.jpg
mkdir -p /home/$1/.i3/
cp ../i3/config /home/$1/.i3/config
chmod 776 /home/$1/.i3/config
#bash einstelln
cp ../bashinit/.bashrc /home/$1/ ;
chmod 776 /home/$1/.bashrc
cp ../bashinit/.dircolors /home/$1/ ;
chmod 776 /home/$1/.dircolors
cp ../bashinit/rc.conf /home/$1/.config/ranger/ ;
chmod 776 /home/$1/.config/ranger/rc.conf
cp ../bashinit/.bash_aliases /home/$1/ ;
chmod 776 /home/$1/.bash_aliases
cp ../bashinit/.bash_profile /home/$1/ ;
chmod 776 /home/$1/.bash_profile
cp ../scripte/.falsch.sh /home/$1/ ;
chmod 776 /home/$1/.falsch.sh
cp ../bashinit/.vimrc /home/$1/ ;
chmod 776 /home/$1/.vimrc

#DVD codec css installieren
apt-get install libdvdread4 ;
mkdir ./dvd/ ;
mv libdvdcss-1.2.13.tar.bz2 dvd/ ;
cd dvd/ ;
tar -xf libdvdcss-1.2.13.tar.bz2 ;
cd libdvdcss-1.2.13 ;
./configure --prefix=/usr ;
make install ;
cd ../.. ;
rm -rf dvd/ ;

#diable beeping
rmmod pcspkr
echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf
#cp ../bashinit/.inputrc /home/$1/
#chmod 774 /home/$1/.inputrc
#cp ../bashinit/.xprofile /home/$1
#chmod 774 /home/$1/.xprofile

if [ "$2" == "real" ] || [ "$3" == "real" ] || [ "$4" == "real" ]
then
apt-get install -y firmware-realtek
fi

else
	echo "USER ist nicht gesetzt"
fi
