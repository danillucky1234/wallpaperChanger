# Installation
`git clone git@github.com:danillucky1234/wallpaperChanger.git`

<br>

# Usage
`bash wallpaperChanger.sh [options] [path]`  
## Possible options:
Option | Meaning
-------|-----------
-h, --help | Show the help message and exit
-t, --time | Set the time after which wallpaper will be updated (default: 30s)
<br>

# Usage examples
- `bash wallpaperChanger.sh ~/Pictures/landscapes/ -t 1m`<span style="margin:0 10px 0 10px">-</span>This option will change the pictures on the desktop every minute
- `bash wallpaperChanger.sh ~/Pictures/landscapes/ -t "30m 30s"`<span style="margin:0 10px 0 10px">-</span>This option will change the pictures on the desktop every 30 minutes and 30 seconds
- `bash wallpaperChanger.sh ~/Pictures/landscapes/`<span style="margin:0 10px 0 10px">-</span>This option will change the pictures on the desktop every 30 seconds