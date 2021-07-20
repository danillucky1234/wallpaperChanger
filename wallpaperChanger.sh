#!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;36m'
NC='\033[0m'

# If user don't passed any arguments to the program - throw exception
if [ $# == 0 ]; then
	echo -e "${RED}Not enough arguments. Please specify the path to the directory with the pictures${NC}"
	exit 1
fi

printHelpMessage ()
{
	echo -e "${BLUE}Usage:\t${NC}./`basename ${0}` [options] [path]"
	echo ""
	echo -e "${BLUE}Possible options:${NC}"
	echo -e "\t-h, --help\t\tPrint this help message"
	echo -e "\t-t, --time\t\tSet the time after which wallpaper will be updated ${BLUE}[default: 30s]{$NC}"
	echo -e "\t-m, --mixed\t\tPhotos will be taken in random order ${BLUE}[disabled by default]${NC}"
	echo -e "\t-l, --logging\t\tLog all wallpaper names with date of usage to log file ${BLUE}[disabled by default]${NC}"
}

# CONFIG VARS
duration="30s"	# Duration of one picture as wallpaper, 30 seconds by default
logFile="wallpaperChanger.log"

# Parse arguments
for ((i=1; i <= $#; ++i))
do
	if [[ "${!i}" == "-h" || "${!i}" == "--help" ]]; then
		printHelpMessage
		exit
	elif [[ "${!i}" == "-t" || "${!i}" == "--time" ]]; then
		nextArgumentNumber=$((i+1))
		duration=${!nextArgumentNumber} 
		i=$((i+1))
	elif [[ "${!i}" == "-m" || "${!i}" == "--mixed" ]]; then
		mixed=true
	elif [[ "${!i}" == "-l" || "${!i}" == "--logging" ]]; then
		logging=true
	else
		directory=${!i}
	fi
done

# Check if direcory exists
if [[ ! -d $directory ]]; then
	echo "$directory does not exist or is not a directory"
    exit 1
fi

set -e # Bash will throw errors if they occured and stop working

# Add '/' to the end of directory if user doesn't specified it
if [[ $directory != *"/" ]]; then
	directory="${directory}/"
fi

# Fill the array with file names from the directory we want
iterator=0
for file in "$directory"*
do
	if [[ "$file" == *".png" || "$file" == *".jpg" || "$file" == *".jpeg" ]]; then
		array[$iterator]=$file
		iterator=$((iterator+1))
	fi
done

iterator=0

# If variable is empty - if statement return false
while true;
do
	if [[ $mixed ]]; then
		# Set random wallpaper
			file=${array[$RANDOM % ${#array[@]}]}
			if [[ $logging ]]; then
				currentTime=$(date +'%Y-%m-%d %H:%M:%S')
				echo $currentTime >> "$logFile"
				echo "[$iterator] $file" >> "$logFile"
				echo "" >> "$logFile"
			fi
			feh --bg-scale $file
			iterator=$((iterator+1))
			sleep $duration
	else
		# Iterate through the directory and install the wallpaper one by one
		for file in "${array[@]}"
		do
			if [[ $logging ]]; then
				currentTime=$(date +'%Y-%m-%d %H:%M:%S')
				echo $currentTime >> "$logFile"
				echo "[$iterator] $file" >> "$logFile"
				echo "" >> "$logFile"
				iterator=$((iterator+1))
			fi
			feh --bg-scale $file
			sleep $duration
		done
	fi
done
