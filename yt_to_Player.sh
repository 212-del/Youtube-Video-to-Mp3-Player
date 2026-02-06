#!/bin/bash
 #add a section to install yt-dlp and update it.
cd /tmp/
if  [[ ls -d /tmp/* | grep "trash" ]]; then
  mkdir trash
 else
  echo " Trash Folder Already Exist!!"
fi
sudo chmod -R u+rw /tmp/trash/
read -r -p "Enter the youtube video link: " link
read -r -p "Enter the filename: " filename
echo "If you are gettin any error do update your yt-dlp"
yt-dlp  --cookies-from-browser brave --js-runtimes node -x --audio-format mp3 -o "/tmp/trash/${filename}.%(ext)s"  ${link} ;  mpv /tmp/trash/${filename}.mp3

