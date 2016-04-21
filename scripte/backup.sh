#source
source="-e ssh kevin.luedemann@login.cip.physik.uni-goettingen.de:/home/kevin.luedemann/Documents/5.Semester/"

#directory
dir="/home/pi/.backup/"

#backup for deleated
bdir="/home/pi/.backup/old/"

#delete and exclulde parameter
param=(--delete --delete-excluded --exclude=Bilder/)

#parameters
options=(-avzbnP)

rsync -avzbnP ${param}  "${source}" "${dir}"  --backup-dir="${bdir}"
