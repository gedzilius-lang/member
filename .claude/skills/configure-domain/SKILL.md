---
name: configure-domain
description: Configure nginx site + Let's Encrypt SSL for client subdomain; ensure app binds localhost only.
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

# configure-domain

## Contract
- Read **docs/BLUEPRINT.md** first.
- Work in small commits.
- If any command fails, stop and run the **diagnostics** skill; append results to the current SESSION log.

## Standard checks (must)
- `git status` clean before finishing.
- `docker compose ps` healthy after finishing.
- `curl -fsS http://127.0.0.1:3100/health` returns 200 (inside VPS).
