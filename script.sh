# to handle rebbot make a flag_rebooted_from_script = false = 0 seem better
# before rebooting setting it to true and make it persistent (env file ?)
# then in this script if flag_rebbot_from_script ...

CONFIG_FILE="config.json"
#echo $CONFIG_FILE
DATE=$(date +"%s")
echo "current date : $DATE or $(date)" 

apt update -y && apt upgrade -y

# to be able to manage json in bash
apt install jq -y

# binaries from CONFIG_FILE
BIN=$(jq -r '.binaries[]' $CONFIG_FILE)
echo "binaries : $BIN"

# backup_location from CONFIG_FILE
LOC=$(jq -r ".backup_location[]" $CONFIG_FILE)
echo "locations for backup : $LOC" 

echo "making installation from config file"
# install each bin in 
for b in $BIN
do
    echo "installing $b "
    apt install $b -y
done

echo "getting drivers"
ubuntu-drivers devices > drivers.txt
echo "drivers can be found in ./driver.txt"

# import json to know what to dowload on your system

#replace  with backup location from json
#echo $(ls)
if ! test -d "./backup"
then
    echo "starting backup for user's home :"
    mkdir ./backup
    rsync -a --progress / backup/sys_backup_$DATE
    echo "backup done in ./backup/sys_backup_$Date/"
    for l in $LOC
    do
        # should check if location is local !
        echo "moving backup to $l"
        cp ./backup/sys_backup_$DATE $l/sys_backup_$DATE
    done
else 
    ls ./backup
    echo "backup already done !"
fi

# from then should log every action so you can lauch back and relauch actions

# custom dns ?

#echo "it is recommanded to use :    apt install ubuntu-restricted-extras"

# light night ?

# customize your desktop
apt install gnome-browser-connector
# get look from gnome extension using curl ?

# see ubuntu setup

apt install docker
apt install docker-compose
docker-compose up