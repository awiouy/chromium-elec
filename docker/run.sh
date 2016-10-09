#!/bin/bash

chmod 777 /dev/vchiq
startx -- :0 &
sleep 2

export DISPLAY=:0
xset -dpms
xset s off
xset s noblank

nc -l -u -p 1234|./tmp/input.sh &

chromium-browser --verbose --no-sandbox --user-data-dir="/storage/.config/chromium-browser" --start-maximized http://distribution.bbb3d.renderfarming.net/video/mp4/bbb_sunflower_1080p_30fps_normal.mp4 &

while ps axg | grep -vw grep | grep -w chromium-browser > /dev/null; do sleep 1; done

exit
