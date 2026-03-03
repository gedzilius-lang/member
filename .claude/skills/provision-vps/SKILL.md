---
name: provision-vps
description: Provision and configure a fresh VPS (Docker, Nginx, SSL, firewall).
version: 1.0.0
tools:
  - shell
  - file_edit
  - git
---

# provision-vps

## Purpose
Provision and configure a fresh VPS (Docker, Nginx, SSL, firewall).

## Execution Rules
- Log execution in /ops/logs/
- Be idempotent
- Fail safely
- Validate output
