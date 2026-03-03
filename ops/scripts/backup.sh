#!/usr/bin/env bash
set -euo pipefail
BACKUP_DIR="${BACKUP_DIR:-/var/backups/member-os}"
RETENTION_DAYS="${RETENTION_DAYS:-14}"
mkdir -p "$BACKUP_DIR"
TS="$(date -u +%Y%m%d-%H%M%SZ)"

docker compose exec -T db pg_dump -U postgres -d memberos | gzip > "${BACKUP_DIR}/pg-${TS}.sql.gz"
find "$BACKUP_DIR" -type f -name "pg-*.sql.gz" -mtime "+${RETENTION_DAYS}" -delete
