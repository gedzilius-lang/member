---
name: backup-restore-test
description: Execute backup and restore validation process.
version: 1.0.0
tools:
  - shell
  - file_edit
  - git
---

# backup-restore-test

## Purpose
Execute backup and restore validation process.

## Execution Rules
- Log execution in /ops/logs/
- Be idempotent
- Fail safely
- Validate output
