#!/bin/bash
bash ~/scripts/foxy.sh
sleep 1

case $1 in
devices) adb devices -l ;;
restart) adb kill-server && adb start-server ;;
screen) adb exec-out screencap -p > screen_$(date +%Y%m%d_%H%M%S).png ;;
*) echo "Usage: foxy-adb {devices|restart|screen|}" ;;
esac
