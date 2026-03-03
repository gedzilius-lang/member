#!/usr/bin/env bash
set -euo pipefail
DOMAIN="$1"
EMAIL="$2"
SITE="/etc/nginx/sites-available/${DOMAIN}"

if [ ! -f "$SITE" ]; then
sudo tee "$SITE" >/dev/null <<EOF
server {
  listen 80;
  server_name ${DOMAIN};
  location / {
    proxy_pass http://127.0.0.1:3100;
    proxy_set_header Host \$host;
    proxy_set_header X-Real-IP \$remote_addr;
    proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto \$scheme;
  }
}
EOF
sudo ln -sf "$SITE" "/etc/nginx/sites-enabled/${DOMAIN}"
sudo nginx -t
sudo systemctl reload nginx
fi

sudo certbot --nginx -d "$DOMAIN" --non-interactive --agree-tos -m "$EMAIL" || true
sudo systemctl reload nginx
