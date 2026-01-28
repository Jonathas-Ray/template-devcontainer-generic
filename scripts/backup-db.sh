#!/bin/bash

set -e

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_DIR="/workspace/backups"
FILENAME="backup_${MYSQL_DATABASE}_${TIMESTAMP}.sql"

echo "📦 Iniciando backup do banco..."

docker exec \
  $(docker compose ps -q mysql) \
  mysqldump \
    -u"$MYSQL_USER" \
    -p"$MYSQL_PASSWORD" \
    "$MYSQL_DATABASE" \
  > "$BACKUP_DIR/$FILENAME"

echo "✅ Backup concluído:"
echo "   $BACKUP_DIR/$FILENAME"
