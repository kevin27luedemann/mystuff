
#i3 config files
rm -f $HOME/.i3/
rm -f $HOME/.i3status.conf
ln -s $HOME/Documents/mystuff/dotfiles/.i3/ 		$HOME/
ln -s $HOME/Documents/mystuff/dotfiles/.i3status.conf 	$HOME/

##Qtile xsession file
#sudo cp ./qtile.desktop /usr/share/xsessions/

#bash config files
rm -f $HOME/.bashrc
rm -f $HOME/.bash_aliases
rm -f $HOME/.bash_profile
ln -s $HOME/Documents/mystuff/dotfiles/.bashrc 		$HOME/
ln -s $HOME/Documents/mystuff/dotfiles/.bash_aliases 	$HOME/
ln -s $HOME/Documents/mystuff/dotfiles/.bash_profile 	$HOME/

#Vim
rm -f $HOME/.vimrc
ln -s $HOME/Documents/mystuff/dotfiles/.vimrc 		$HOME/

#Inputrc and X
rm -f $HOME/.inputrc
rm -f $HOME/.Xresources
rm -f $HOME/.xprofile
rm -f $HOME/.Xdefaults
rm -f $HOME/.dircolors
ln -s $HOME/Documents/mystuff/dotfiles/.inputrc 	$HOME/
ln -s $HOME/Documents/mystuff/dotfiles/.Xresources 	$HOME/
ln -s $HOME/Documents/mystuff/dotfiles/.xprofile 	$HOME/
ln -s $HOME/Documents/mystuff/dotfiles/.Xdefaults 	$HOME/
ln -s $HOME/Documents/mystuff/dotfiles/.dircolors 	$HOME/

#MPD config
rm -f $HOME/.mpdconf
ln -s $HOME/Documents/mystuff/dotfiles/.mpdconf 	$HOME/
