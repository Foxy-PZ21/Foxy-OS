#!/bin/bash
bash ~/scripts/foxy.sh
sleep 1
echo -e "\033[1;36m[ СИСТЕМНАЯ ИНФОРМАЦИЯ ]\033[0m"
echo "------------------------------------------"
echo -e "Дата: $(date)"
echo -e "Пользователь: $USER"
echo -e "Uptime: $(uptime -p)"
echo "Загрузка CPU: $(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')%"
echo "Память:      $(free -m | awk 'NR==2{printf "%.2fGB / %.2fGB", $3/1024, $2/1024}')"
echo "Диск (root): $(df -h / | awk 'NR==2 {print $4 " свободно из " $2}')"
echo -e "IP Адрес:    \033[0;37m192.168.**.*** [PROTECTED]\033[0m"
echo "------------------------------------------"
echo -e "\033[1;32m[ OK ] All Foxy-scripts are active.\033[0m"

