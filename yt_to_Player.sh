#!/bin/bash
read -r -p "Enter the youtube video link: " link
read -r -p "Enter the filename: " filename
yt-dlp -x --audio-format mp3 -o "trash/${filename}.%(ext)s"  $link &&  ffplay trash/${filename}.mp3

