#!/bin/bash
bash ~/scripts/foxy.sh
sleep 1

# Папка, куда будем сохранять
BACKUP_DIR=~/Backups
# Имя файла с датой
FILENAME="foxy_backup_$(date +%Y%m%d_&H%M).tar.gz"

mkdir -p $BACKUP_DIR

echo "--- Начинаем резервное копирование... ---"

# Архивируем папку со скриптами и документами
# Добавь через пробел другие папки, если нужно
tar -cfz $BACKUP_DIR/$FILENAME ~/scripts //Dockuments/Upwork_Knowledge

echo "--- Готово! Архив создан: $BACKUP_DIR/$FILENAME ---"
echo "--- Совет: скинь этот файл на флешку или в облако! ---"
