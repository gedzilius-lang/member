---
name: diagnostics
description: Collect logs and summarize errors when deployment fails.
version: 1.0.0
tools:
  - shell
  - file_edit
  - git
---

# diagnostics

## Purpose
Collect logs and summarize errors when deployment fails.

## Execution Rules
- Log execution in /ops/logs/
- Be idempotent
- Fail safely
- Validate output
