---
name: clone-detection-test
description: Simulate clone anomaly and verify detection logic.
version: 1.0.0
tools:
  - shell
  - file_edit
  - git
---

# clone-detection-test

## Purpose
Simulate clone anomaly and verify detection logic.

## Execution Rules
- Log execution in /ops/logs/
- Be idempotent
- Fail safely
- Validate output
