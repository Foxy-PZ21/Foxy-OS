#!/bin/bash
bash ~/scripts/foxy.sh
sleep 1

case $1 in
test)
echo "--- Testing Download/Upload Speed ---" 
speedtest-cli --simple
 ;;
ping)
echo "--- Cheking Connection Stability (Google & Cloudflare) ---"
echo "Goole DNS:"
ping -c 4 8.8.8.8 | grep 'avg'
echo "Cloudflare DNS"
ping -c 4 1.1.1.1 | grep 'avg' ;;
local)
echo "--- Your Local IP Addresses ---"
hostname -I ;;
*)
echo "Usage: foxy-net {test|ping|local}"
;;
esac
