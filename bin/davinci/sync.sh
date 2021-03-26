#!/usr/bin/env bash

echo "#############################################################################"
echo "# Fetch content from phone"
echo "#############################################################################"
cd /run/user/1000/gvfs/mtp:host=SAMSUNG_SAMSUNG_Android_RZ8NC1G1THV/Phone/DCIM/Camera
CURRENT_DAY=$(date '+%Y-%m-%d')
mkdir -p ~/Videos/vlog/$CURRENT_DAY
mv $(find . -name \*.mp4 -mtime -1) ~/Videos/vlog/$CURRENT_DAY

echo "#############################################################################"
echo "# Convert Footage For DaVinci"
echo "#############################################################################"
cd ~/Videos/vlog/$CURRENT_DAY
~/bin/convert-footage .

echo "#############################################################################"
echo "# Cleanup"
echo "#############################################################################"
rm *.mp4

xdg-open ~/Videos/vlog/$CURRENT_DAY/
