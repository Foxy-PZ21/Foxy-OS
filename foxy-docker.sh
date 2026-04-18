#!/bin/bash
bash ~/scripts/foxy.sh
sleep 1

BLUE='\e[1;34m'
GREEN='\e[1;32m'
CYAN='\e[1;36m'
RED='\e[1;31m'
NC='\e[0m'

echo -e "${BLUE}--- FOXY-DOCKER MONITOR ---${NC}"

if ! systemctl is-active --quiet docker; then
    echo -e "${RED}[ERROR] Docker is not running!${NC}"
    exit 1
fi

if [ -z "$(docker ps -q)" ]; then
    echo -e "${CYAN}[INFO] No running containers. Starting test...${NC}"
    docker run -d --name foxy-test-nginx nginx:alpine > /dev/null
fi

echo -e "${CYAN}NAME             CPU %     MEM USAGE / LIMIT${NC}"
docker stats --no-stream --format "{{.Name}}: \t{{.CPUPerc}} \t{{.MemUsage}}"

echo -e "\n${BLUE}--- NETWORK TOPOLOGY ---${NC}"
docker ps --format "{{.Names}}" | while read container; do
    IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$container")
    echo -e "${GREEN}Container:${NC} $container  -->  ${CYAN}IP:${NC} $IP"
done
echo -e "${BLUE}---------------------------------------${NC}"
