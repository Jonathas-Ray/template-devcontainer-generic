#!/bin/bash

set -e

if [ -z "$1" ]; then
  echo "❌ Informe o arquivo de backup:"
  echo "   ./scripts/restore-db.sh backups/arquivo.sql"
  exit 1
fi

BACKUP_FILE=$1

if [ ! -f "$BACKUP_FILE" ]; then
  echo "❌ Arquivo não encontrado: $BACKUP_FILE"
  exit 1
fi

echo "♻️ Restaurando banco..."

cat "$BACKUP_FILE" | docker exec -i \
  $(docker compose ps -q mysql) \
  mysql \
    -u"$MYSQL_USER" \
    -p"$MYSQL_PASSWORD" \
    "$MYSQL_DATABASE"

echo "✅ Restauração concluída"
