---
name: backup-restore-test
description: Verify daily backups and perform a restore drill into a temporary database.
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

# backup-restore-test

## Contract
- Read **docs/BLUEPRINT.md** first.
- Work in small commits.
- If any command fails, stop and run the **diagnostics** skill; append results to the current SESSION log.

## Standard checks (must)
- `git status` clean before finishing.
- `docker compose ps` healthy after finishing.
- `curl -fsS http://127.0.0.1:3100/health` returns 200 (inside VPS).
