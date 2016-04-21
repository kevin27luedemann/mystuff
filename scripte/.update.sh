#source
source="-e ssh pi@192.168.2.161:/home/pi/Documents/"

#directory
dir="/home/luedemann/Documents/"

#backup for deleated
bdir="/home/luedemann/Documents/.old/"

#delete and exclulde parameter
exclude="Bilder/"

#parameters
options=(-avzbn)

rsync -avuz --delete --delete-excluded $source $dir --backup-dir=$bdir
