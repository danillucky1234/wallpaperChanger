# Installation
1. `git clone git@github.com:danillucky1234/wallpaperChanger.git`  
2. `cd wallpaperChanger/`  
3. `./wallpaperChanger.sh -h`  
<br>

# Usage
`./wallpaperChanger.sh [options] [path]`  
## Possible options:
Option | Meaning
-------|-----------
-h, --help | Show the help message and exit
-t, --time | Set the time after which wallpaper will be updated [default: 30 seconds]
-m, --mixed | Photos will be taken in random order [disabled by default]
-l, --logging | Save all changes to the log file [disabled by default]
<br>

# Usage examples
- `./wallpaperChanger.sh ~/Pictures/wallpapers -t 1m` - This option will change the pictures on the desktop every minute
- `./wallpaperChanger.sh -t "30m 30s" ~/Pictures/landscapes/` - This option will change the pictures on the desktop every 30 minutes and 30 seconds
- `./wallpaperChanger.sh ~/Pictures/landscapes/` - This option will change the pictures on the desktop every 30 seconds  
- `./wallpaperChanger.sh -m ~/Pictures/landscapes/ -t 5s -l` - Thsi option will change your wallpapers every 5 seconds in random order and save all changes to the file

## Requirements
- [feh](https://linux.die.net/man/1/feh)

## Tip
I run the script like this:  
`./wallpaperChanger.sh <path/to/the/wallpapers> <options> & disown`

I add an '&' at the end to run the script in the background and remove it from jobs table. It might help you if you accidentally close the terminal.  

To terminate the process use:  
`ps -aux | grep wallpaper`
and after this `kill <pid>`
