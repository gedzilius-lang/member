---
name: security-review
description: Run security checks (ports, SSL, binding, rate limiting).
version: 1.0.0
tools:
  - shell
  - file_edit
  - git
---

# security-review

## Purpose
Run security checks (ports, SSL, binding, rate limiting).

## Execution Rules
- Log execution in /ops/logs/
- Be idempotent
- Fail safely
- Validate output
