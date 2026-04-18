#!/bin/bash
bash ~/scripts/foxy.sh
sleep 1

BLUE='\e[1;34m'
GREEN='\e[1;32m'
RED='\e[1;31m'
NC='\e[0m'

echo -e "${BLUE}--- FOXY-CLEAN SYSTEM OPTIMIZER ---${NC}"

# 1. Проверка места ДО
BEFORE=$(df -h / | awk 'NR==2 {print $4}')
echo -ne "Free space before: ${GREEN}$BEFORE${NC}\n"

# 2. Очистка кэша APT
echo -ne "Cleaning APT cache... "
sudo apt-get clean && echo -e "${GREEN}Done${NC}"

# 3. Очистка старых логов
echo -ne "Cleaning old logs... "
sudo find /var/log -type f -name "*.log" -mtime +7 -delete 2>/dev/null && echo -e "${GREEN}Done${NC}"

# 4. Очистка Docker (самое важное для портфолио!)
if command -v docker &> /dev/null; then
    echo -e "${BLUE}Cleaning Docker junk...${NC}"
    docker system prune -f | grep "Total reclaimed space" || echo "No docker junk found"
fi

# 5. Проверка места ПОСЛЕ
AFTER=$(df -h / | awk 'NR==2 {print $4}')
echo -e "Free space after: ${GREEN}$AFTER${NC}"
echo -e "${BLUE}-----------------------------------${NC}"
