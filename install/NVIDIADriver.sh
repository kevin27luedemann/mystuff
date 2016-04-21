if [ "$1" == 'N' ]
then
dnf install akmod-nvidia "kernel-devel-uname-r == $(uname -r)";
dnf update -y
else
dnf install vdpauinfo libva-vdpau-driver libva-utils
fi
