---
name: deploy-update
description: Pull, build, migrate, restart services safely.
version: 1.0.0
tools:
  - shell
  - file_edit
  - git
---

# deploy-update

## Purpose
Pull, build, migrate, restart services safely.

## Execution Rules
- Log execution in /ops/logs/
- Be idempotent
- Fail safely
- Validate output
