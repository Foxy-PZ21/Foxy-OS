#!/bin/bash
#Foxy Module: Spy
# shellcheck source=/home/foxy/foxy-admin/security/base_config.sh
# shellcheck disable=SC1091
source "/home/foxy/foxy-admin/security/base_config.sh"

log_action "Spy: Starting audit..."

if grep -q "ATTACK" "$LOG_FILE"; then
    log_action "Spy: ALLERT! Attack signature found."
    exit 1
fi

log_action "Spy: System clear."
exit 0