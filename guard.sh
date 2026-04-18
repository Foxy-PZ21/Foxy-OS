#!/bin/bash
bash ./foxy.sh
sleep 1
#Foxy Guard: Main Entry Point
# shellcheck source=/home/foxy/foxy-admin/security/base_config.sh
# shellcheck disable=SC1091
source "/home/foxy/foxy-admin/security/base_config.sh"

log_action "Guard: Initializing Warden..."

if "/home/foxy/foxy-admin/security/foxy-warden.sh"; then
   log_action "Guard: Warden finished successfully."
   echo -e "\e[32m[OK] Warden completed the test successfully.\e[0m"
   exit 0
else
   log_action "Guard: CRITICAL ERROR: Warden crashed or returned error!"
   echo -e "\e[41m[!!!] CRTICAL ERROR: Warden crashed [!!!]\e[0m"
   exit 1
fi 