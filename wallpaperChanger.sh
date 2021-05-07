#!/bin/bash

# The program changes the wallpaper on the gnome DE every certain time.
# It takes as an argument the directory from which it takes pictures and puts them on the desktop

RED='\033[0;31m'
BLUE='\033[0;36m'
NC='\033[0m'

if [ $# == 0 ]
then
	echo -e "${RED}Not enough arguments. Please specify the path to the directory with the pictures${NC}"
	exit
fi

printHelpMessage ()
{
	echo -e "${BLUE}Usage:\t${NC}bash wallpaperChanger.sh [options] [path]"
	echo ""
	echo -e "${BLUE}Possible options:${NC}"
	echo -e "\t-h, --help\t\tPrint this help message"
	echo -e "\t-t, --time\t\tSet the time after which wallpaper will be updated (default: 30s)"
	echo -e "\t-m, --mixed\t\tPhotos will be placed on the wallpaper in random order"
}

duration="30s" # Duration of the wallpaper
for ((i=1; i <= $#; ++i))
do
	currentNumberOfArgument+=1
	if [[ "${!i}" == "-h" || "${!i}" == "--help" ]]
	then
		printHelpMessage
		exit
	elif [[ "${!i}" == "-t" || "${!i}" == "--time" ]]
	then
		nextArgumentNumber=$((i+1))
		duration=${!nextArgumentNumber} 
	fi
done

while true;
do
	# $1 - specified directory
	for file in "$1"/*
	do
		if [[ "$file" == *".png" || "$file" == *".jpg" || "$file" == *".jpeg" ]]
		then
			gsettings set org.gnome.desktop.background picture-uri "file:///${file}"
			sleep $duration
		fi
	done
done
