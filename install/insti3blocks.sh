dnf install -y ruby rubygem-ronn
git clone git://github.com/vivien/i3blocks
cd i3blocks
make clean debug
make install
cp i3blocks.conf /home/luedemann/.config/i3/
cd ..
rm -rf i3blocks
