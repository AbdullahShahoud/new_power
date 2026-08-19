# Mobile UI Specification — Notifications
### دليل بناء واجهة الإشعارات، مشتقّ من البيانات الفعلية للـ API

**Companion:** [notifications-mobile-integration.md](../api/notifications-mobile-integration.md) — the API contract. This document is the **UI layer** on top of it.
**Design system:** reuses the tokens, typography and RTL rules from [catalog-ui-spec.md](catalog-ui-spec.md) §2 and §8. Only what is *specific to notifications* is defined here.

### Label key

| Label | Meaning |
| --- | --- |
| **[C]** | Confirmed — the field/behaviour exists in the backend. |
| **[I]** | Inferred — implied by the data shape. |
| **[D]** | **Design proposal** — change freely; it will not break the integration. |
| **[X]** | Not supported by the data — do **not** design it. |

---

## 1. What the data lets you build — and what it doesn't

Six constraints shape every pixel of this feature.

### 1.1 ⛔ There are only TWO live notification types

**[C]** `NotificationType` declares seven values, but a sweep of every producer in the backend shows only **`SECURITY`** (6 events) and **`SYSTEM`** (2 events) are ever emitted. `TRANSACTION`, `MARKETING`, `MESSAGE_RECEIVED`, `PAYMENT_REQUEST_RECEIVED` and `PAYMENT_REQUEST_UPDATED` are e-wallet leftovers with no code path.

**[X] Do not design:** a seven-way filter bar, per-type tabs, transaction/payment icons, or a "messages" section.
**[D] Design instead:** **three chips — الكل · الأمان · النظام**. That is the whole taxonomy.

### 1.2 ⛔ The row carries no priority, no icon, no image, no action link

**[C]** The `Notification` model is exactly: `id, type, status, title, message, metadata, readAt, createdAt`. There is **no** `priority`, `severity`, `imageUrl`, `iconName`, `actionUrl`, `deepLink`, `category` or `groupKey`.

**[X] Do not design:** rich media cards, hero images, per-notification CTA buttons driven by the server, or a server-driven priority sort.
**[D] Design instead:** derive **icon + severity colour client-side** from `type` + `metadata` (§4.2). This is the single most important derivation in the feature — the API gives you nothing visual.

### 1.3 ⛔ Most notifications have nowhere to go

**[C]** Of the 8 events a rep can receive, only **two** have a plausible in-app destination (2FA enabled → security settings; password changed → security settings). "Account Approved", "Account Suspended", "Account Reactivated" and broadcasts describe a state, they do not point anywhere.

**[X] Do not design:** a chevron on every row, or a mandatory detail screen.
**[D] Design instead:** the tile is **informational by default**. Tapping marks it read and expands the message inline. Only rows whose derived sub-type has a real destination get a trailing action link.

### 1.4 ⛔ Archived notifications cannot be listed or restored

**[C]** `GET /notifications` hard-codes `archivedAt: null`, so `?status=ARCHIVED` always returns an empty page, and there is no un-archive route.

**[X] Do not design:** an "Archived" tab, a trash bin, or an undo-after-refresh flow.
**[D] Design instead:** treat archive as **delete**. Offer a **local, time-boxed Undo snackbar** (client-side only — restore the row in the list and simply do not re-send anything if the user undoes before the request fires). After that it is gone.

### 1.5 ⛔ Preferences are read-only

**[C]** There is **no** `PATCH /notifications/preferences`. The DTO and service method exist but no controller route calls them.

**[X] Do not design:** working toggles.
**[D] Design instead:** either omit the settings screen, or show the five flags as **read-only status rows** with an explanatory line. See §6.

### 1.6 ⛔ Everything is in English

**[C]** All titles and messages come from a hard-coded English `NOTIFICATION_TEMPLATES`. No `Localized` pair, no `ar` field, no locale parameter.

**[D] Design instead:** ship an **Arabic replacement map** (§5) keyed on the derived sub-type. Render the Arabic string, not the server's English. **Broadcasts are the exception** — they are free text typed by an admin and must be shown verbatim.

---

## 2. Screen inventory

| # | Screen | Data source |
| --- | --- | --- |
| S1 | Inbox (list) | `GET /notifications` |
| S1-b | Empty inbox | same, `data: []` |
| S1-c | Loading | skeletons |
| S2 | Filtered inbox | `GET /notifications?type=SECURITY` |
| S3 | Expanded tile / detail sheet | local (from the list row) |
| S4 | Settings — read-only | `GET /notifications/preferences` |
| S5 | Badge placements | `GET /notifications/unread-count` |
| S6 | Push presentation | FCM `notification` + `data` |

---

## 3. Component inventory

### 3.1 `NotificationTile` — the workhorse

**Source:** `GET /notifications` → `data[]`

```
┌────────────────────────────────────────────┐
│ ●  ┌────┐  تم تغيير كلمة المرور            │  ← ● unread dot (start edge)
│    │ 🔑 │  تم تغيير كلمة مرور حسابك. إن    │  ← derived icon (§4.2)
│    └────┘  لم تكن أنت، تواصل مع الدعم…     │  ← 2 lines, ellipsis
│            منذ ٣ ساعات            الأمان    │  ← relative time · type chip
└────────────────────────────────────────────┘
```

| Slot | Field | Behaviour |
| --- | --- | --- |
| Unread dot | `status == 'UNREAD'` | **[D]** 8px `--accent` dot at the inline-start edge; the whole tile also gets `--primary-soft` tint at 40% |
| Icon | **derived** from `type` + `metadata` (§4.2) | **[C]** No icon field exists — you must derive it |
| Title | `title` → **Arabic map** (§5) | 1 line, ellipsis |
| Body | `message` → **Arabic map** | **[D]** 2 lines collapsed; tap expands to full |
| Time | `createdAt` | **[D]** Arabic relative (`منذ ٣ ساعات`), absolute after 7 days |
| Type chip | `type` | **[D]** `الأمان` / `النظام` — muted, `caption` size |
| Trailing | — | **[D]** Chevron **only** when the derived sub-type has a destination (§4.3) |

**[C]** `metadata` can be `null` and its keys vary per event → **every lookup must be null-safe**. A tile must render correctly with `metadata: null`.

**[D] Height:** fixed two-line body so the list does not go ragged; expansion animates height rather than reflowing neighbours.

### 3.2 `TypeAvatar` — the derived icon

**[D]** 40×40, radius `md`, tinted background at 12% of the severity colour, glyph at full colour. Never a photo — there is no image field.

### 3.3 `UnreadDot` + `BadgeCount`

**[C]** Badge value = `GET /notifications/unread-count` → `data.count`.

**[D]** Cap the display at `99+`. Place on the bell icon in the app bar **and** on the bottom-nav tab. Both read the same single source of truth in your state layer — never two independent fetches.

### 3.4 `DateSectionHeader`

**[C]** There is **no** `groupKey` on the row. **[D]** Group client-side on `createdAt`: `اليوم` · `أمس` · `هذا الأسبوع` · `أقدم`. Sticky header, `label` type, `--text-muted`.

### 3.5 `FilterChips`

**[D]** Exactly three, horizontally scrollable, single-select:

```
[ الكل ]  [ الأمان ]  [ النظام ]
```

**[C]** Maps to no param / `?type=SECURITY` / `?type=SYSTEM`.
**[X]** No `status` chips — an "Archived" filter returns nothing (§1.4), and Unread/Read is better served by §3.6.

### 3.6 `MarkAllReadButton`

**[D]** Text button in the app bar, **enabled only when the badge > 0**.

⚠️ **[C]** The `count` returned by `PATCH /read-all` also includes archived rows, so it can exceed what the user saw. **[D] Never show it.** Snackbar copy: `تم تعليم الكل كمقروء` — no number.

### 3.7 `SwipeToArchive`

**[D]** Swipe from the inline-end edge reveals a `--danger` panel with a trash glyph.

⚠️ **[C]** Archiving is **irreversible server-side**. **[D]** Fire the `DELETE` after a **4-second local Undo window**: remove the tile immediately, show the snackbar, and only send the request when the window closes. Undo simply cancels the pending request — no API call needed.

⚠️ **[C]** Archiving an **unread** notification decrements the badge (the count filters `archivedAt: null`) but does **not** mark it read. **[D]** Decrement the local badge optimistically in that case.

### 3.8 `SkeletonTile` / `EmptyState`

**[D]** Skeletons mirror the real tile (avatar circle + two text bars). Empty state per §7.

---

## 4. ⚠️ The derivation tables — the heart of this UI

The API gives you no icon, no colour and no destination. All three are derived. **[D]** These tables are the proposal; the inputs they read are **[C]**.

### 4.1 Sub-type resolution

**[C]** `metadata` shapes, straight from the backend:

```dart
String subType(Notification n) {
  final m = n.metadata;
  if (m == null) return 'BROADCAST';                    // no metadata → admin broadcast
  if (m['type'] == 'PASSWORD_CHANGED')      return 'PASSWORD_CHANGED';
  if (m['type'] == 'TWO_FACTOR_ENABLED')    return 'TWO_FACTOR_ENABLED';
  if (m['action'] == 'PASSWORD_RESET')      return 'PASSWORD_RESET';
  if (m['resetBy'] == 'admin')              return 'ADMIN_PASSWORD_RESET';
  if (m.containsKey('approvedBy'))          return 'ACCOUNT_APPROVED';
  if (m.containsKey('representativeId'))    return 'REP_PENDING_APPROVAL';  // managers only
  if (m.containsKey('newStatus')) {
    switch (m['newStatus']) {
      case 'SUSPENDED': return 'ACCOUNT_SUSPENDED';
      case 'BANNED':    return 'ACCOUNT_BANNED';
      case 'ACTIVE':    return 'ACCOUNT_REACTIVATED';
    }
  }
  return 'BROADCAST';
}
```

⚠️ **[C]** Note the trap: `metadata.type` is a **sub-event name** (`PASSWORD_CHANGED`), while the row's own `type` column is the **category** (`SECURITY`). They are different fields with the same name. Never conflate them.

**[D]** Anything unresolved falls back to `BROADCAST` — the safe generic style.

### 4.2 Icon + severity

| Sub-type | Glyph | Severity | Colour token |
| --- | --- | --- | --- |
| `ACCOUNT_SUSPENDED` | shield-alert | **critical** | `--danger` |
| `ACCOUNT_BANNED` | shield-x | **critical** | `--danger` |
| `ADMIN_PASSWORD_RESET` | key-alert | **warning** | `--warning` |
| `PASSWORD_RESET` | key | warning | `--warning` |
| `PASSWORD_CHANGED` | key | neutral | `--info` |
| `TWO_FACTOR_ENABLED` | shield-check | positive | `--success` |
| `ACCOUNT_REACTIVATED` | shield-check | positive | `--success` |
| `ACCOUNT_APPROVED` | badge-check | positive | `--success` |
| `REP_PENDING_APPROVAL` | user-clock | neutral | `--primary` |
| `BROADCAST` | megaphone | neutral | `--primary` |

**[D] Critical rows get one extra treatment and nothing more:** a 3px inline-start bar in `--danger`. Resist banners, red backgrounds or blocking dialogs — `Account Suspended` already ends the user's session in practice, and shouting about it in the inbox adds nothing.

### 4.3 Destination

| Sub-type | Tapping goes to |
| --- | --- |
| `PASSWORD_CHANGED` · `PASSWORD_RESET` · `ADMIN_PASSWORD_RESET` | **[D]** Security settings → change password |
| `TWO_FACTOR_ENABLED` | **[D]** Security settings → 2FA |
| everything else | **[D]** Nowhere. Expand inline only. |

**[C]** There is no server-provided link, so this mapping is entirely yours and must degrade safely: an unknown sub-type must **never** show a chevron.

---

## 5. ⚠️ Arabic string map

**[C]** The server sends English. **[D]** Render these instead, keyed on the **sub-type** (stable) rather than the title text (fragile — it changes whenever the backend edits a template).

| Sub-type | العنوان | النص |
| --- | --- | --- |
| `ACCOUNT_APPROVED` | تمت الموافقة على حسابك | أهلاً بك! وافق مديرك على حسابك، يمكنك تسجيل الدخول الآن. |
| `PASSWORD_CHANGED` | تم تغيير كلمة المرور | تم تغيير كلمة مرور حسابك. إن لم تكن أنت، تواصل مع الدعم فوراً. |
| `PASSWORD_RESET` | تم تغيير كلمة المرور | تمت إعادة تعيين كلمة مرورك بنجاح. |
| `ADMIN_PASSWORD_RESET` | تمت إعادة تعيين كلمة المرور | أُعيد تعيين كلمة مرورك. راجع بريدك للحصول على كلمة مرور مؤقتة ثم غيّرها. |
| `TWO_FACTOR_ENABLED` | تم تفعيل التحقق بخطوتين | أصبح حسابك محمياً بالتحقق بخطوتين. |
| `ACCOUNT_SUSPENDED` | تم تعليق الحساب | تم تعليق حسابك. افتح التطبيق للتفاصيل أو تواصل مع مديرك. |
| `ACCOUNT_BANNED` | تم تقييد الحساب نهائياً | تم تقييد حسابك بشكل دائم. تواصل مع الدعم. |
| `ACCOUNT_REACTIVATED` | تمت إعادة تفعيل الحساب | حسابك نشط مجدداً. أهلاً بعودتك! |
| `REP_PENDING_APPROVAL` | مندوب جديد بانتظار الموافقة | سجّل مندوب باستخدام رمزك وينتظر موافقتك. |
| `BROADCAST` | — **اعرض `title` كما هو** | — **اعرض `message` كما هو** |

⚠️ **[D] Broadcasts are never mapped.** An admin types them at runtime, in whatever language they choose. Render verbatim, and wrap in a `Directionality` widget that **auto-detects** direction from the first strong character — an English broadcast inside an RTL list will otherwise render misaligned.

**[D]** Dynamic values (`approvedBy` is a **uuid**, not a name) cannot be interpolated — **[C]** the API sends the id, never the manager's name. So the Arabic strings above are deliberately written without a name slot.

---

## 6. Screen specifications

### S1 — Inbox

```
┌──────────────────────────────────┐
│ ←  الإشعارات      تعليم الكل ✓   │  ← enabled only when badge > 0
├──────────────────────────────────┤
│ [ الكل ] [ الأمان ] [ النظام ]   │  ← 3 chips only
├──────────────────────────────────┤
│ اليوم                             │  ← sticky date header (client-side)
│ ● 🔑 تم تغيير كلمة المرور   ›    │  ← unread + destination chevron
│      منذ ٣ ساعات        الأمان   │
│ ┃ 🛡 تم تعليق الحساب              │  ← ┃ = 3px danger bar (critical)
│      منذ ٥ ساعات        الأمان   │
├──────────────────────────────────┤
│ أمس                               │
│   ✅ تمت الموافقة على حسابك       │  ← read: no dot, no tint
│      أمس ١٤:٢٢         النظام    │
└──────────────────────────────────┘
```

**[D] Interactions**

| Gesture | Result |
| --- | --- |
| Tap a tile | `PATCH /{id}/read` (fire-and-forget), remove the dot **optimistically**, expand the body |
| Tap a tile with a destination | Same, then navigate |
| Swipe (end edge) | Archive with a 4s local Undo (§3.7) |
| Pull to refresh | `GET /notifications?page=1` + `GET /unread-count` |
| Scroll to bottom | `page + 1` while `page < totalPages` |
| Tap "تعليم الكل" | `PATCH /read-all`, badge → 0, all dots cleared, snackbar without a number |

**[C] Pagination:** `limit ≤ 100`, `totalPages = ceil(total/limit)`. **[D]** Use `limit=20`, prefetch at 70%.

⚠️ **[C]** Reset to `page=1` whenever the `type` chip changes.

### S1-b — Empty states

**[D]** Two distinct states, because they mean different things:

| Condition | Copy |
| --- | --- |
| No notifications at all | **لا توجد إشعارات**<br>ستصلك هنا تنبيهات الأمان وتحديثات حسابك. |
| Filter applied, nothing matches | **لا توجد إشعارات في هذا التصنيف**<br>`[ عرض الكل ]` ← primary action |

**[C]** An empty inbox is `200` with `data: []` — an empty state, **never** an error screen.

### S1-c — Loading

**[D]** 5 skeleton tiles matching the real layout. No centred spinner.

### S3 — Expanded tile

**[D]** Prefer **inline expansion** over a detail screen: the payload is a title, a two-line message and a timestamp — a full screen for that is empty.

```
┌────────────────────────────────────────┐
│   🔑  تم تغيير كلمة المرور              │
│                                        │
│   تم تغيير كلمة مرور حسابك. إن لم      │
│   تكن أنت، تواصل مع الدعم فوراً.       │
│                                        │
│   ⓘ تم تسجيل الخروج من الأجهزة الأخرى  │  ← from metadata (§6.1)
│                                        │
│   ١٩ آب ٢٠٢٦ · ٠٨:٤٠                   │
│   [ إعدادات الأمان ]      [ أرشفة ]    │
└────────────────────────────────────────┘
```

#### 6.1 Rendering `metadata` **[D]**

**[C]** `metadata` is free-form and mostly contains ids, not names. Render **only** the keys that mean something to a rep:

| Key | Render as | Skip? |
| --- | --- | --- |
| `loggedOutOtherSessions: true` | `تم تسجيل الخروج من الأجهزة الأخرى` | show |
| `previousStatus` / `newStatus` | — | **skip** — already implied by the message |
| `approvedBy`, `adminId`, `representativeId` | — | **skip — these are raw uuids, not names** ⚠️ |
| `timestamp` | — | **skip** — `createdAt` already shown |
| `type`, `action`, `resetBy` | — | **skip** — consumed by the derivation |

⚠️ **[C] Never display a raw uuid to a rep.** The API returns `approvedBy: "9f2c8a7e-…"` with no name resolution anywhere on this surface.

### S4 — Settings (read-only)

⚠️ **[C]** There is no update route. **[D]** Two acceptable designs — pick one and be explicit:

**Option A (recommended): omit the screen entirely** until the backend ships `PATCH /notifications/preferences`. A settings screen whose controls do nothing is worse than no screen.

**Option B: read-only status list**

```
┌──────────────────────────────────┐
│ ←  إعدادات الإشعارات             │
├──────────────────────────────────┤
│ ⓘ تُدار هذه الإعدادات من قِبل     │
│   الإدارة حالياً.                 │
├──────────────────────────────────┤
│ تنبيهات الأمان            مفعّل ✓ │  ← securityEnabled
│ إشعارات النظام            مفعّل ✓ │  ← systemEnabled
│ الإشعارات الفورية (Push)  مفعّل ✓ │  ← pushEnabled
└──────────────────────────────────┘
```

**[D]** Show only the **three flags that govern live types** (`securityEnabled`, `systemEnabled`, `pushEnabled`). **[X]** Hide `transactionEnabled` and `marketingEnabled` — they govern types this backend never emits, so displaying them promises a feature that does not exist.

**[D]** Render as static status rows (checkmark + label), **not** as disabled switches — a greyed-out switch invites tapping and reads as a bug.

### S5 — Badge placement

**[C]** Source: `GET /unread-count` → `data.count`.

**[D]** Two placements, one state object: the bell in the app bar and the bottom-nav tab.

⚠️ **[I] Do not poll on a timer.** The count is write-through cached server-side (invalidated on every mutation), so event-driven refresh is both cheaper and equally fresh. Refresh on: app start · resume (debounced ≥ 30s) · FCM received · after any local mutation · inbox opened.

**[C]** The 30 req/60s rate limit is **shared with the catalogue and directory**. A 30-second poller burns 2 req/min permanently and will collide with a rep browsing products.

### S6 — Push presentation

**[C]** The server sends a **hybrid `notification` + `data`** message with `android.priority: high` and `apns.aps.sound: default`. It sets **no `channel_id`** and **no `click_action`**.

**[D] Required client work:**
- Declare an Android channel yourself — **[D]** two channels: `security` (high importance, sound) and `general` (default). Route on `data.type`.
- The system tray renders the **English** `notification.title`/`body` while backgrounded — **[C] you cannot localise a backgrounded push**. **[I]** If Arabic push text is required, the backend must send it; raise it alongside §12-Q2 of the API spec.
- In the foreground, **suppress the OS notification** and show an in-app snackbar in Arabic instead — this is the one place you can localise.
- On tap: route from `data.notificationId` (§4.3), then refresh badge + inbox.

---

## 7. State matrix

**[D]** Every state the inbox needs:

| State | Visual |
| --- | --- |
| Loading (first page) | 5 skeleton tiles |
| Loading (next page) | 2 skeletons appended |
| Empty (no filter) | Bell glyph + "لا توجد إشعارات" |
| Empty (filtered) | Glyph + `[ عرض الكل ]` as primary action |
| Error (network) | Inline retry card, existing rows preserved |
| `429` | Non-blocking inline hint — **never** a dialog |
| Offline | Show the cached page + a persistent "غير متصل" strip |

**[I]** There is **no 503** on this surface and no domain-specific error — a failure here is either auth, validation (a client bug), or rate limiting.

---

## 8. Offline behaviour

**[C]** There is no sync endpoint, no cursor, no checksum — nothing resembling the catalogue's offline machinery.

**[D] Recommended, and deliberately minimal:**

| Item | Treatment |
| --- | --- |
| Last fetched page | Cache locally; show it read-only when offline |
| Badge count | Cache the last known value; show it dimmed |
| Read / archive actions | ⚠️ **Disable while offline.** Do **not** queue them. |

⚠️ **[I] Why no queue:** `PATCH /read` and `DELETE` are individually replay-safe, but a queued archive is **irreversible on the server** and the user will have forgotten they swiped. The value of an offline archive queue does not justify a silent destructive replay hours later.

---

## 9. Motion & micro-interactions **[D]**

| Interaction | Treatment |
| --- | --- |
| Tile tap → read | Unread dot scales to 0 (120ms), tint fades out (200ms) |
| Tile expand | Height animate 220ms `easeOutCubic`, body cross-fades |
| Swipe archive | Tile collapses height 200ms, snackbar rises |
| Mark all read | Dots stagger out at 30ms intervals, capped at 8 |
| Badge change | Digit rolls; badge pulses once when it increases |
| New push (foreground) | In-app snackbar slides from the top, 4s auto-dismiss |
| Pull to refresh | Standard indicator; badge and list refresh together |

**[D]** Cap staggered animations at 8 tiles — an inbox can hold hundreds.

---

## 10. Accessibility **[D]**

- Tap targets ≥ 48×48; the swipe action must have a **long-press menu alternative** — swipe alone is not accessible.
- Announce unread state in the semantics label: `غير مقروء، تم تغيير كلمة المرور، منذ ٣ ساعات`.
- Severity is **never colour-alone**: critical rows carry the inline-start bar **and** a distinct glyph.
- Badge announces as `٤ إشعارات غير مقروءة`, not just `٤`.
- Relative timestamps need an absolute value in the semantics label.

---

## 11. RTL & typography notes

**[D]** Inherits [catalog-ui-spec.md](catalog-ui-spec.md) §8 wholesale. Two additions specific to notifications:

⚠️ **[D] Broadcast text needs auto-direction.** An admin may write in English or Arabic. Wrap broadcast `title`/`message` in a `Directionality` resolved from the first strong character, or an English broadcast will render right-aligned with punctuation flipped.

**[D] Relative time in Arabic** needs a proper pluralisation table — `منذ دقيقة` / `منذ دقيقتين` / `منذ ٣ دقائق` / `منذ ١١ دقيقة`. Arabic has dual and two plural forms; a naive `منذ $n دقيقة` is wrong for `n = 2`.

**[D]** Keep Western digits throughout, consistent with the rest of the app.

---

## 12. Build checklist

**Foundations**
- [ ] Sub-type derivation function (§4.1) with a `BROADCAST` fallback ⚠️
- [ ] Icon + severity table (§4.2)
- [ ] Arabic string map keyed on **sub-type**, not title ⚠️
- [ ] Broadcast auto-direction wrapper ⚠️
- [ ] Arabic relative-time formatter with dual + plural forms

**Components**
- [ ] `NotificationTile` — fixed height, null-safe `metadata`, optional chevron
- [ ] `TypeAvatar` — derived glyph, tinted background
- [ ] `DateSectionHeader` — client-side grouping (no `groupKey` exists) ⚠️
- [ ] `FilterChips` — **three only** ⚠️
- [ ] `MarkAllReadButton` — enabled on badge > 0, **no count in the snackbar** ⚠️
- [ ] `SwipeToArchive` — 4s local Undo, then fire `DELETE` ⚠️
- [ ] Long-press alternative to swipe (a11y)
- [ ] Skeletons + both empty states

**Screens**
- [ ] S1 inbox — pagination, page reset on filter change
- [ ] S3 inline expansion — **never render raw uuids** ⚠️
- [ ] S4 — omit, or read-only with 3 flags only ⚠️
- [ ] S5 — one badge state object, **event-driven refresh only** ⚠️
- [ ] S6 — declare Android channels; suppress OS notification in foreground

**Do NOT build**
- [ ] ~~Seven type filters~~ **[X]** only 2 types are live
- [ ] ~~Archived tab / trash / restore~~ **[X]** unreachable and irreversible
- [ ] ~~Working preference toggles~~ **[X]** no update route
- [ ] ~~Server-driven priority sort~~ **[X]** no priority field
- [ ] ~~Rich media / hero images~~ **[X]** no image field
- [ ] ~~Per-row server CTAs~~ **[X]** no action link field
- [ ] ~~Offline read/archive queue~~ **[X]** archive is irreversible
- [ ] ~~"N notifications marked read"~~ **[X]** the count is unreliable
- [ ] ~~Manager/admin names in the body~~ **[X]** the API returns uuids only

---

## 13. Open UI questions

**UQ-1 — Is a settings screen worth shipping at all?**
With no update route (§1.5) and only three meaningful flags, Option A (omit) is the honest choice. Product decision.

**UQ-2 — Should backgrounded push be Arabic?**
The OS renders `notification.title`/`body` verbatim, so backgrounded pushes are **English regardless of client work**. Fixing it requires server-side Arabic. Is an English tray notification acceptable for v1?

**UQ-3 — How loud should `ACCOUNT_SUSPENDED` be?**
A suspended rep is already blocked at the JWT strategy (`AUTH_USER_NOT_ACTIVE`), so they will most likely be logged out before reading it. Is a full-screen interstitial warranted, or is the inbox row (current proposal) enough?

**UQ-4 — Undo window length.**
4 seconds is proposed for archive. Longer is friendlier but delays the API call and complicates the pending-request queue. Confirm.

**UQ-5 — Does the rep app ever run as a manager?**
`REP_PENDING_APPROVAL` is manager-only. If the same build serves both roles, that sub-type needs a destination (the approvals queue); if not, it can be dropped from the derivation table.
