#!/bin/bash

systemctl stop kodi
modprobe snd_bcm2835

fbset -g 1920 1080 1920 1080 32

bash ./input.sh &

rm -rf /storage/.config/chromium-browser/SingletonLock
docker run -it -p 1234:1234/udp --privileged -v /storage:/storage -v /var/run/dbus:/run/dbus chrome

while ps axg | grep -vw grep | grep -w chromium-browser > /dev/null; do sleep 1; done

rmmod snd_bcm2835
systemctl start kodi