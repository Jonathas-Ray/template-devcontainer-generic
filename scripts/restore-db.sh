#!/bin/bash
# Uso: ./scripts/restore-db.sh <arquivo_de_backup> [mysql|postgres|mongodb]

set -e

BACKUP_FILE=$1
ENGINE=${2:-mysql}

if [ -z "$BACKUP_FILE" ]; then
  echo "Uso: ./scripts/restore-db.sh <arquivo_de_backup> [mysql|postgres|mongodb]"
  exit 1
fi

if [ ! -f "$BACKUP_FILE" ]; then
  echo "Arquivo não encontrado: $BACKUP_FILE"
  exit 1
fi

case "$ENGINE" in
  mysql)
    docker exec -i mysql \
      mysql -u"${MYSQL_USER:-app_user}" -p"${MYSQL_PASSWORD:-app_pass}" \
      "${MYSQL_DATABASE:-app_db}" < "$BACKUP_FILE"
    echo "Restaurado no MySQL a partir de $BACKUP_FILE"
    ;;
  postgres)
    docker exec -i -e PGPASSWORD="${POSTGRES_PASSWORD:-app_pass}" postgres \
      psql -U "${POSTGRES_USER:-app_user}" "${POSTGRES_DB:-app_db}" < "$BACKUP_FILE"
    echo "Restaurado no PostgreSQL a partir de $BACKUP_FILE"
    ;;
  mongodb)
    docker exec -i mongodb \
      mongorestore --username "${MONGO_USER:-app_user}" \
                   --password "${MONGO_PASSWORD:-app_pass}" \
                   --db "${MONGO_DB:-app_db}" \
                   --archive < "$BACKUP_FILE"
    echo "Restaurado no MongoDB a partir de $BACKUP_FILE"
    ;;
  *)
    echo "Engine desconhecida: $ENGINE. Use: mysql | postgres | mongodb"
    exit 1
    ;;
esac
