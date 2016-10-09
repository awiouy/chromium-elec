#!/bin/sh

. /etc/os-release

systemctl stop kodi

case "$LIBREELEC_ARCH" in
  RPi*)
    dtparam audio=on
    fbset -g 1920 1080 1920 1080 32
    ;;
  *)
esac

./input.sh &

rm -fr /storage/.config/chromium-browser/SingletonLock
docker run --privileged -it \
           -p 1234:1234/udp \
           -v /storage:/storage \
           -v /var/run/dbus:/run/dbus chrome

pkill -P $$

case "$LIBREELEC_ARCH" in
  RPi*)
    fbset -g 1 1 1 1 32
    ;;
  *)
esac

systemctl start kodi
