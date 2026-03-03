---
name: provision-vps
description: Provision a fresh Ubuntu 22.04 VPS for a single-tenant client instance (nginx, SSL, firewall, backups, health checks).
version: 2.0.0
scope: repo
invocation: auto
tools:
  shell: allowed
  git: allowed
  file_edit: allowed
inputs:
  required:
    - repo_root
outputs:
  required:
    - ops/logs/SESSION-*.md
---

# provision-vps

## Contract
- Read **docs/BLUEPRINT.md** first.
- Work in small commits.
- If any command fails, stop and run the **diagnostics** skill; append results to the current SESSION log.

## Standard checks (must)
- `git status` clean before finishing.
- `docker compose ps` healthy after finishing.
- `curl -fsS http://127.0.0.1:3100/health` returns 200 (inside VPS).
