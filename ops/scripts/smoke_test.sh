#!/usr/bin/env bash
set -euo pipefail
curl -fsS http://127.0.0.1:3100/health >/dev/null
echo "[smoke] health OK"
