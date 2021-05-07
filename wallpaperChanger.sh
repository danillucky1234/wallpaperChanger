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
	echo -e "\t-m, --mixed\t\tPhotos will be taken in random order"
}

duration="30s" # Duration of the wallpaper
mixed=false
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
	elif [[ "${!i}" == "-m" || "${!i}" == "--mixed" ]]
	then
		mixed=true
	fi
done

randomNumber=$((1 + $RANDOM % 10)) # set random number from 1 to 10
countOfPicturesInTheDirectory=0   # in for loop we will search the count of pictures
currentNumber=0		   # we will compare this variable with random, if they are same and we use mixed version - we should use this pic, else skip picture

while true;
do
	# $1 - specified directory
	for file in "$1"/*
	do
		if [[ "$file" == *".png" || "$file" == *".jpg" || "$file" == *".jpeg" ]]
		then
			if [ $mixed = true ] # if we use mixed option
			then
				if [ $currentNumber == $randomNumber ] # we compare two variables, and if they are same - we change wallpaper
				then
					#currentNumber=0 # reset the value
					gsettings set org.gnome.desktop.background picture-uri "file:///${file}"
					sleep $duration
				else # if they aren't same, we increment currentNumber and compare the numbers again
					currentNumber=$((currentNumber+1))
				fi
			else # if we don't use mixed option, we just set new wallpaper every loop cycle
				gsettings set org.gnome.desktop.background picture-uri "file:///${file}"
				sleep $duration
			fi
			countOfPicturesInTheDirectory=$((countOfPicturesInTheDirectory+1))
		fi
	done
	
	randomNumber=$((1 + $RANDOM % $countOfPicturesInTheDirectory))
	countOfPicturesInTheDirectory=0
	currentNumber=0 # reset the value
done
