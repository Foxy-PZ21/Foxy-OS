#!/bin/bash
#Foxy Module: Permissions
# shellcheck source=/home/foxy/foxy-admin/security/base_config.sh
# shellcheck disable=SC1091
source "/home/foxy/foxy-admin/security/base_config.sh"

log_action "Perm: Checking file integrity..."
FILE_TO_CHECK="$FOXY_ROOT/config/settings.conf"

if [ -f "$FILE_TO_CHECK" ] && [ "$(stat -c %a "$FILE_TO_CHECK")" != "600" ]; then
    log_action "Perm ALLERT: Wrong permissions on $FILE_TO_CHECK. Fixing..."
    chmod 600 "$FILE_TO_CHECK"
    exit 1
fi

log_action "Perm: Integrity verified."
exit 0