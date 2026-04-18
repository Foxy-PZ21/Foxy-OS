#!/bin/bash
#Foxy Module: Shield
# shellcheck source=/home/foxy/foxy-admin/security/base_config.sh
# shellcheck disable=SC1091
source "/home/foxy/foxy-admin/security/base_config.sh"

apply_shield() {
    sudo ufw --force enable
    sudo ufw default deny incoming
}

log_action "Shield: Deploying defensive measures..."

if apply_shield; then
   log_action "Shield: FAILED to deploy!"
   exit 1
else
   log_action "Shield: Active"
   exit 0
fi