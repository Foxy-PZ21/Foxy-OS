#!/bin/bash
# shellcheck source=/home/foxy/foxy-admin/security/base_config.sh
# shellcheck disable=SC1091
source "/home/foxy/foxy-admin/security/base_config.sh"

log_action "Warden: Starting tactical assessment..."

"/home/foxy/foxy-admin/security/foxy-spy.sh"
SPY_STATUS=$?

"/home/foxy/foxy-admin/security/foxy-perm.sh"
PERM_STATUS=$?

if [ $SPY_STATUS -ne 0 ]; then
    echo -e "\e[31m[!] Spy reports: suspicious activity detected!\e[0m"
    read -rp ">> Expand Shield? (y/n): " choice
    if [[ "$choice" == "y" ]]; then
        "/home/foxy/foxy-admin/security/foxy-shield.sh"
    else
        log_action "Warden: Threat ignored by user."
    fi
fi

if [ $PERM_STATUS -ne 0 ]; then
    echo -e "\e[31m[!] Perm reports: access right issues detected.\e[0m"
    read -rp ">> Fix right automatically? (y/n): " choice
    if [[ "$choice" == "y" ]]; then
        log_action "Warden: Correcting permissions..."
   fi
fi

log_action "Warden: Tactical cycle complete."
echo "--- Scaning completed ---"