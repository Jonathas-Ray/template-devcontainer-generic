#!/bin/bash

DB_HOST=${DB_HOST:-mysql}
DB_USER=${DB_USER:-app_user}
DB_PASSWORD=${DB_PASSWORD:-app_pass}
DB_NAME=${DB_NAME:-app_db}

BACKUP_FILE=$1

if [ -z "$BACKUP_FILE" ]; then
  echo "Uso: ./restore.sh <caminho_do_backup.sql>"
  exit 1
fi

docker exec -i mysql \
  mysql -u$DB_USER -p$DB_PASSWORD $DB_NAME < $BACKUP_FILE

echo "Backup restaurado de $BACKUP_FILE"
