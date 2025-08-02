#!/bin/bash
echo "Enter the youtube video link"
read -r link
echo "Enter the filename"
read -r filename
yt-dlp -x --audio-format mp3 -o "trash/${filename}.%(ext)s"  $link &&  ffplay trash/${filename}.mp3

