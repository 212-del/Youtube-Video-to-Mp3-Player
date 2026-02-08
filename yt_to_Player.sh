#!/bin/bash
 # ===============================
# Install or update yt-dlp
# ===============================

YTDLP_PATH="$HOME/.local/bin/yt-dlp"

echo "Checking yt-dlp..."

# Create bin directory if it doesn't exist
mkdir -p "$HOME/.local/bin"

# Download latest version every time
curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp \
  -o "$YTDLP_PATH"

# Make it executable
chmod a+rx "$YTDLP_PATH"

echo "yt-dlp installed/updated at $YTDLP_PATH"

# Add to PATH if not already present
if ! echo "$PATH" | grep -q "$HOME/.local/bin"; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# Show version
yt-dlp --version

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

