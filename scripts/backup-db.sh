#!/bin/bash
# Uso: ./scripts/backup-db.sh [mysql|postgres|mongodb]
# Padrão: mysql

set -e

ENGINE=${1:-mysql}
BACKUP_DIR="$(dirname "$0")/../backups"
mkdir -p "$BACKUP_DIR"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

case "$ENGINE" in
  mysql)
    docker exec mysql \
      mysqldump -u"${MYSQL_USER:-app_user}" -p"${MYSQL_PASSWORD:-app_pass}" \
      "${MYSQL_DATABASE:-app_db}" \
      > "$BACKUP_DIR/mysql_backup_$TIMESTAMP.sql"
    echo "Backup MySQL gerado em $BACKUP_DIR/mysql_backup_$TIMESTAMP.sql"
    ;;
  postgres)
    docker exec -e PGPASSWORD="${POSTGRES_PASSWORD:-app_pass}" postgres \
      pg_dump -U "${POSTGRES_USER:-app_user}" "${POSTGRES_DB:-app_db}" \
      > "$BACKUP_DIR/postgres_backup_$TIMESTAMP.sql"
    echo "Backup PostgreSQL gerado em $BACKUP_DIR/postgres_backup_$TIMESTAMP.sql"
    ;;
  mongodb)
    docker exec mongodb \
      mongodump --username "${MONGO_USER:-app_user}" \
                --password "${MONGO_PASSWORD:-app_pass}" \
                --db "${MONGO_DB:-app_db}" \
                --archive \
      > "$BACKUP_DIR/mongo_backup_$TIMESTAMP.archive"
    echo "Backup MongoDB gerado em $BACKUP_DIR/mongo_backup_$TIMESTAMP.archive"
    ;;
  *)
    echo "Engine desconhecida: $ENGINE. Use: mysql | postgres | mongodb"
    exit 1
    ;;
esac
