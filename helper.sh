#!/bin/bash
bash ~/scripts/foxy.sh
sleep 1

# --- БЛОКНОТ №1: DOCKER & SYSTEM AUTOMATION ---

case $1 in
  clean)
    echo "--- Cleaning Docker Garbage ---"
    docker system prune -f
    ;;
  update)
    echo "--- Updating System ---"
    sudo apt update && sudo apt upgrade -y
    ;;
  status)
    echo "--- System Status ---"
    uptime
    df -h | grep '^/dev/'
    docker ps -a
    ;;
  *)
    echo "Usage: ./docker_master.sh {clean|update|status}"
    ;;
esac
