# Promoter Membership OS — Master Blueprint (v2)

## 0. Goal
Build a single-tenant (one promoter per VPS) membership + community system using NFC/QR cards.
The repository contains **blueprint + application code**; Claude Code regenerates/updates code per blueprint.

## 1. Core UX
### 1.1 Public pages (no login)
- `/` Community Hub (promoter posts + upcoming events list)
- `/leaderboard` Public leaderboard (lifetime + weekly)
- `/terms` `/privacy` Static pages

### 1.2 NFC/QR entrypoint
- Card encodes: `https://client.domain.com/t/<uuid-v4>` (token)
- `/t/:token` behavior:
  1) If token unissued -> show "Card not active" (staff-only activation path)
  2) If token issued but member not registered -> registration form + consent + set 6-digit PIN
  3) If registered -> if session valid -> redirect to `/me`; else prompt PIN -> create session -> `/me`

### 1.3 Member private profile
- `/me` (PIN/session required)
  - level + progress bar
  - check-in history
  - quests progress
  - rewards (available / redeemed)
  - device list (last login, last tap)

### 1.4 Door staff panel (mobile-first)
- `/door` requires staff login
- If staff opens `/t/:token` while authenticated -> render **Door Panel**:
  - member summary (name, level, last visit, streak, warnings)
  - buttons:
    - `Check-in` (creates check-in, enforces anti-abuse)
    - `Redeem drink reward` (event-scoped)
    - `Redeem free entry`
    - `Grant drink credit` (event-scoped)

## 2. Rules
### 2.1 PIN + Session
- 6-digit numeric PIN.
- Session default 7 days.
- Session cookie: httpOnly, secure, sameSite=lax.
- New device requires PIN re-entry.

### 2.2 Invite-only
- Promoter/staff issues cards/tokens; **member registers only at first tap**.

### 2.3 Check-in anti-abuse
- One check-in per member per event per calendar day.
- Duplicate attempt -> block + log.

### 2.4 Clone detection
- `clone_score` per card/member.
- Signals:
  - Same token used from different device fingerprint within 10 minutes
  - Rapid alternating device use across short window
- Action:
  - Increase score; show warning
  - If score >= threshold -> require PIN every tap

## 3. Quests
Types: CHECKIN_COUNT, STREAK, ATTEND_EVENT
Expiry: WEEKLY or EVENT_SCOPED
Rewards: DRINK_CREDIT (event-scoped), FREE_ENTRY (event-scoped)
Redemption: staff-only, manual confirm at door.

## 4. Financial analytics (tiers)
Promoter defines drink catalog per template and event override.
System tracks reward redemptions.
Promoter inputs sold counts manually.
Dashboard shows revenue vs reward cost.

## 5. Tech stack
- Next.js 14 App Router in apps/web
- Postgres 16
- Docker Compose + Nginx reverse proxy
- PWA offline queue (IndexedDB) for door actions (to be implemented)

## 6. Deployment
- App binds `127.0.0.1:3100`
- Nginx TLS proxy
- Daily backups, 14 rolling days

## 7. Acceptance tests
- /health OK
- token flow works
- check-in works + duplicate blocked
- quest -> reward -> redemption works
- clone anomaly increments clone_score
