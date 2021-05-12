# Installation
`git clone git@github.com:danillucky1234/wallpaperChanger.git`  
`cd wallpaperChanger/`  
`./wallpaperChanger.sh -h`  
<br>

# Usage
`./wallpaperChanger.sh [options] [path]`  
## Possible options:
Option | Meaning
-------|-----------
-h, --help | Show the help message and exit
-t, --time | Set the time after which wallpaper will be updated (default: 30s)
-m, --mixed | Photos will be taken in random order
<br>

# Usage examples
- `./wallpaperChanger.sh ~/Pictures/landscapes/ -t 1m` - This option will change the pictures on the desktop every minute
- `./wallpaperChanger.sh ~/Pictures/landscapes/ -t "30m 30s"` - This option will change the pictures on the desktop every 30 minutes and 30 seconds
- `./wallpaperChanger.sh ~/Pictures/landscapes/` - This option will change the pictures on the desktop every 30 seconds  
- `./wallpaperChanger.sh -m ~/Pictures/landscapes/` - This option let you to change the pictures on the desktop every 30 seconds in random order  

## Tip
I run the script like this:  
`./wallpaperChanger.sh ~/Pictures/landscapes/ &`

I add an '&' at the end to run the script in the background. To terminate the process use:  
`ps -aux | grep wallpaper`
and after this `kill <pid>`