#zuerst updates installieren
dnf update -y
#erste handvoll wichtige programme
dnf install -y okular filezilla git ncdu cowsay fortune-firefly mc feh ImageMagick arandr gcc gcc-c++ xterm ranger hexedit
#vim mit latex installieren
dnf install -y vim vim-enhanced vim-latex vim-X11 texlive texlive-bibtex-bin texlive-latex-bin
#vlc mediaplayer installieren
./getnonfreerepo.sh
dnf install -y vlc
#google chrome installieren
./installgooglechrome.sh
#install python
./instpython.sh
#install i3blocks fuer Statusleiste
./insti3blocks.sh
#install texlive optional
#dnf install texlive-scheme-full
