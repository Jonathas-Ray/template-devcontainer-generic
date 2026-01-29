#!/bin/bash
DB_HOST=${DB_HOST:-mysql}
DB_USER=${DB_USER:-app_user}
DB_PASSWORD=${DB_PASSWORD:-app_pass}
DB_NAME=${DB_NAME:-app_db}

# Pasta onde os backups vão ficar (host)
BACKUP_DIR=/workspace/backups

mkdir -p $BACKUP_DIR

docker exec -i mysql \
  mysqldump -u$DB_USER -p$DB_PASSWORD $DB_NAME > $BACKUP_DIR/backup_$(date +%Y%m%d_%H%M%S).sql

echo "Backup gerado em $BACKUP_DIR"



# Certifique-se de que estas variáveis existem no .env
