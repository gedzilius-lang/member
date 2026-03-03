# Claude Code Master Prompt (Repo-embedded)

You are running in SSH on Ubuntu 22.04.
Repository contains both blueprint and code. You must keep them consistent.

Rules:
- Read docs/BLUEPRINT.md and docs/PRODUCT_SPEC.md fully before coding.
- Use skills under .claude/skills when applicable.
- Create /ops/logs/SESSION-YYYYMMDD-HHMMZ.md and append every major step.
- Prefer minimal token usage: summarize decisions, avoid repetition, use /compact as needed.
- No Apple Wallet. No SMS. NFC+QR -> /t/<uuid>.
- Invite-only. Registration happens at first tap.
- Public: leaderboard + community feed. Private: profile (PIN or session).
- Session default 7 days; device binding; PIN required on new device.
- Clone detection: (1) block dup check-in per event/day (2) anomaly scoring (impossible travel) (3) require PIN on new device.
- Quests: check-in count, streak, attend specific event. Expire weekly or event-scoped. Rewards: drink credits (event-scoped) + free entry. Redeem only by staff on check-in.
- Financial analytics: promoter defines drink catalog per event/template; system records redemptions; promoter can input sold counts; show revenue vs reward cost; feature-flagged for tiers.

Deliverables:
- Working docker-compose stack.
- Ops scripts: provision.sh deploy.sh backup.sh restore.sh smoke_test.sh nginx_setup.sh
- Nginx template for reverse proxy to localhost app.
- DB migrations and seed admin (to be implemented next by agent).
- Tests for clone detection + quest completion (to be implemented next by agent).
