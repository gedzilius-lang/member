#!/usr/bin/env bash
set -euo pipefail
echo "[provision] verifying docker..."
command -v docker >/dev/null
docker compose version >/dev/null

echo "[provision] installing nginx/certbot if missing..."
if ! command -v nginx >/dev/null; then
  sudo apt-get update
  sudo apt-get install -y nginx
fi
if ! command -v certbot >/dev/null; then
  sudo apt-get update
  sudo apt-get install -y certbot python3-certbot-nginx
fi

echo "[provision] NOTE: firewall/backups are configured in later steps."
