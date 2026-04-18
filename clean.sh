#!/bin/bash

echo "--- 1. Cleaning Docker Garbage ---"
docker system prune -f

echo "--- 2. Updating System Packages ---"
sudo apt update && sudo apt upgrade -y

echo "--- 3. System Status ---"
uptime
df -h | grep '^/dev/'
echo "--- Done! ---"
