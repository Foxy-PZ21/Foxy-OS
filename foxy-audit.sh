#!/bin/bash
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
REPORT_FILE="$SCRIPT_DIR/Foxy_Audit_Report.txt"

bash ~/scripts/foxy.sh
sleep 1

# Дизайн отчета Foxy-OS
DATE=$(date '+%Y-%m-%d %H:%M:%S')
REPORT_FILE="Foxy_Audit_Report.txt"

{
    echo "=========================================="
    echo "   FOXY-OS SYSTEM AUDIT REPORT          "
    echo "   Generated: $DATE                    "
    echo "=========================================="
    echo ""
    
    echo "[1] SYSTEM STATUS (foxy-info)"
    bash "$HOME/scripts/foxy-info.sh"
    echo ""

    echo "[2] NETWORK TOPOLOGY (foxy-net)"
    bash "$HOME/scripts/net_helper.sh"
    echo ""

    echo "[3] DOCKER INFRASTRUCTURE (foxy-docker)"
    bash "$HOME/scripts/foxy-docker.sh"
    echo ""

    echo "[4] DISK SPACE BEFORE CLEANUP"
    df -h | grep '^/dev/'
    echo ""

    echo "=========================================="
    echo "   END OF REPORT | READY FOR OPTIMIZATION "
    echo "=========================================="
} > "$REPORT_FILE"

echo "✅ Отчет готов: $REPORT_FILE"

read -p "Do you want to read the report right now? (Y/N): " read_report
if [[ "$read_report" == "Y" ]]; then
clear
if [[ -f "$REPORT_FILE" ]]; then
cat "$REPORT_FILE"
else
echo "Error: File on the way $REPORT_FILE not found!"
fi
echo ""
read -p "Press Enter to return..."
fi

