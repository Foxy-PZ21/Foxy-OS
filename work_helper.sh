#!/bin/bash
bash ~/scripts/foxy.sh
sleep 1

echo "--- Начинаем рабочий день, Foxy! ---"
date

# Открываем Upwork (используем xdg-open для Linux)
xdg-open "https://www.upwork.com/nx/find-work/" &

# Открываем папку с проектами в проводнике
# (Замени путь на свой, если папка называется иначе)
xdg-open ~/Dockuments/Upwork_Knowledge &

echo "--- Всё готово. Удачи с заказами! ---"
