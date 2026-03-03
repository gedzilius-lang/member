#!/usr/bin/env bash
set -euo pipefail
: "${DOMAIN:?Set DOMAIN}"
: "${LETSENCRYPT_EMAIL:?Set LETSENCRYPT_EMAIL}"

docker compose pull || true
docker compose build
docker compose up -d

for i in {1..30}; do
  if curl -fsS http://127.0.0.1:3100/health >/dev/null; then
    echo "[deploy] health OK"
    break
  fi
  sleep 1
done

sudo bash ops/scripts/nginx_setup.sh "$DOMAIN" "$LETSENCRYPT_EMAIL"
bash ops/scripts/smoke_test.sh
