---
name: generate-app
description: Generate full application scaffold based on BLUEPRINT.md.
version: 1.0.0
tools:
  - shell
  - file_edit
  - git
---

# generate-app

## Purpose
Generate full application scaffold based on BLUEPRINT.md.

## Execution Rules
- Log execution in /ops/logs/
- Be idempotent
- Fail safely
- Validate output
