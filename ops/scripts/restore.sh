#!/usr/bin/env bash
set -euo pipefail
FILE="${1:?Usage: restore.sh <pg-*.sql.gz>}"
gunzip -c "$FILE" | docker compose exec -T db psql -U postgres -d memberos
