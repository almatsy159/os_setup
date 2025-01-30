#!/bin/bash
echo $username
echo "hi you are now in the script"

echo "finding drivers and putting them into driver.txt"
#ubuntu-drivers devices >> driver.txt

#username = "user"
#echo $(ls /)
root_dir=$(ls /)
echo $root_dir
echo "dans {$0}"
echo $1

useradd "alma" -m

env

/bin/bash
#$SHELL
