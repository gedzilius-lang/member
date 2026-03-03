---
name: configure-domain
description: Configure Nginx virtual host and SSL for client subdomain.
version: 1.0.0
tools:
  - shell
  - file_edit
  - git
---

# configure-domain

## Purpose
Configure Nginx virtual host and SSL for client subdomain.

## Execution Rules
- Log execution in /ops/logs/
- Be idempotent
- Fail safely
- Validate output
