# NewPower Design Guidelines

Portable brand & design system extracted from the NewPower sales-ops prototype
(`tokens.css`, `chartTheme.ts`, UI components) — intended for reuse across web
and mobile apps.

> Sources of truth in this repo: `src/styles/tokens.css` (all colors/radii/
> shadows), `src/lib/chartTheme.ts` (raw hex for SVG/chart tooling).
> **Do not eyeball-edit status/chart colors** — they are a validated
> CVD-safe palette; re-run `scripts/validate_palette.js` after any change.

---

## 1. Brand

| Item | Value |
|---|---|
| Brand name | NewPower (نيو باور) |
| Business | Saudi electrical products supplier (project-based sales) |
| Logo | `src/assets/newpower-logo.png` (PNG, 250×36, horizontal lockup) |
| Logo colors (extracted) | near-black `#231F20`, red `#ED1C24` |

**RTL-first.** `<html dir="rtl" lang="ar">`. Sidebar anchors on the **right**.
Time-axis charts render in `dir="ltr"` islands (time flows left→right), with
`dir="rtl"` tooltips inside them.

---

## 2. Color tokens

### Brand red ramp (derived from logo red, slot 500)

| Token | Hex |
|---|---|
| brand-50 | `#fef2f2` |
| brand-100 | `#fde3e3` |
| brand-200 | `#fbc9ca` |
| brand-300 | `#f79fa2` |
| brand-400 | `#f25a60` |
| **brand-500** | **`#ec1b23`** |
| brand-600 | `#ce1219` |
| brand-700 | `#ab1016` |
| brand-800 | `#8d1116` |
| brand-900 | `#751317` |
| brand-950 | `#400608` |

Usage: primary buttons (`brand-500`, hover `brand-600`), links (`brand-600`),
active nav tint (`brand-50` bg + `brand-700` text + red indicator bar),
focus rings (`brand-300` border + `brand-100` ring). **Never** use brand red
for the "new" project status — the brand is red, so status "new" is blue.

### Ink ramp (warm neutral, near-black text)

| Token | Hex |
|---|---|
| ink-50 | `#f7f6f3` |
| ink-100 | `#efeeea` |
| ink-200 | `#e1e0d9` |
| ink-300 | `#c9c7c0` |
| ink-400 | `#a5a39c` |
| ink-500 | `#898781` |
| ink-600 | `#6b6963` |
| ink-700 | `#52514e` |
| ink-800 | `#383734` |
| **ink-900** | **`#232220`** (primary text) |
| ink-950 | `#141412` |

### Surfaces & chrome

| Token | Hex | Use |
|---|---|---|
| page | `#f7f6f3` | app background |
| surface | `#ffffff` | cards, sidebar, topbar |
| chart-grid | `#e7e5e0` | hairlines, table row dividers (`ink-100` is same family) |
| chart-axis | `#c9c7c0` | axis lines |
| chart-muted | `#898781` | axis ticks, secondary text |

### Project status palette (validated categorical, CVD-safe)

| Status | Core | Badge bg | Badge text |
|---|---|---|---|
| new | `#2563eb` | `#eff4ff` | `#1d4ed8` |
| follow_up (متابعة) | `#c56e05` | `#fdf3e3` | `#92510a` |
| visit (زيارة) | `#7c3aed` | `#f5f0ff` | `#6d28d9` |
| won (فوز) | `#15803d` | `#eaf7ee` | `#166534` |
| lost (خسارة) | `#e24368` | `#fdeef1` | `#be123c` |
| closed (مغلق) | `#aa5f28` | `#f7efe7` | `#7c451c` |

`lost` is deliberately a rose distinct from brand red; `closed` is sienna.

### Secondary categorical series (charts alongside brand red)

- Chart accent (e.g. rep activity): `#0891b2` — validated pair with `#ec1b23`.

---

## 3. Typography

- **Font:** IBM Plex Sans Arabic (open source) — weights **400, 500, 600, 700**
  (600/700 for emphasis; no light weight — needed for Arabic legibility).
- Self-hosted via `@fontsource/ibm-plex-sans-arabic` — **never CDN fonts**.
- Type scale (Tailwind sizing) and usage:

| Size | Weight | Use |
|---|---|---|
| xs | 500/600/700 | badges, table headers, labels, meta, hints, small buttons |
| sm | 400/500/700 | body text, card titles, nav, form fields, table body |
| base | 700 | dialog titles, mobile stat values |
| lg | 700 | page titles (topbar) |
| 2xl | 600 | KPI numbers in stat cards |
| 3xl+ | 600/700 | dashboard hero numbers |

- **Numbers:** always Western digits with `tabular-nums` in tables/KPIs. SAR
  currency, Gregorian dates — format via `ar-SA-u-nu-latn-ca-gregory` locale
  (`src/lib/format.ts`). Never raw `toLocaleString()`.
- Line-height relaxed (`leading-relaxed`) for Arabic body copy.

---

## 4. Radii & shadows

| Token | Value | Use |
|---|---|---|
| radius-card | `1rem` (16px) | cards, dialogs, big buttons |
| radius-field | `0.625rem` (10px) | inputs, selects, segmented controls |
| rounded-full | pills | status badges, small buttons, filter chips, avatars, nav indicator |
| shadow-card | `0 1px 2px rgba(20,20,18,.04), 0 4px 16px -4px rgba(20,20,18,.06)` | resting cards |
| shadow-card-hover | `0 2px 4px rgba(20,20,18,.05), 0 10px 28px -6px rgba(20,20,18,.12)` | interactive cards |

---

## 5. Core component conventions

| Component | Recipe |
|---|---|
| Primary button | `brand-500` bg, white text, `rounded-full` (or field), `h-10 px-4 text-sm`; md size; `sm: h-8 px-3 text-xs`; hover `brand-600`, disabled `opacity-50` |
| Secondary button | `surface` bg, `ink-200` border, `ink-700` text, hover `ink-50` bg |
| Status badge | `rounded-full px-2.5 py-0.5 text-xs font-semibold`, tinted bg + darkened text (table above) |
| Stat card | `surface` + `shadow-card` + `rounded-card`; label `text-xs ink-500`, value `text-2xl font-semibold ink-950`, hint `text-xs ink-400` |
| Card | `rounded-card shadow-card bg-surface`; title `text-sm font-bold ink-900` |
| Input / select | `rounded-field border ink-200 bg-surface text-sm`; placeholder `ink-400`; focus: `brand-300` border + `ring-2 ring-brand-100`; height 9–10 |
| Table | `text-sm`; header row `text-xs ink-500`, `border-b ink-100`; zebra-free; `tabular-nums` |
| Dialog | title `text-base font-bold ink-950`, description `text-xs ink-500` |
| Avatar | `rounded-full`, Arabic-initial, `size-9` (md) / `size-12` (lg), `text-xs`/`text-sm` |
| Sidebar nav | `rounded-xl px-3.5 py-2.5 text-sm font-medium`; active = `brand-50` bg + `brand-700` text + 4px red rounded bar on the start edge (`inset-y-2 start-0 w-1 rounded-full bg-brand-500`) |
| Topbar | `h-16`, page title `text-lg font-bold ink-950`; search `w-64 rounded-full` |

---

## 6. Data-viz rules (charts)

- Single-series charts: **brand red `#ec1b23` only**.
- Two-series: `#ec1b23` + `#0891b2` (validated pair). Categorical (status)
  charts: the six status colors in `STATUS_ORDER` (new → follow_up → visit →
  won → lost → closed).
- Thin bars: ≤24px width, 4px rounded data-end.
- Solid hairline grid (`#e7e5e0`), muted axis ticks (`#898781`, 11px).
- **Tooltips never gate values** — every chart needs a fallback (legend with
  counts/%, or a table toggle). Donut legend carries count + % per slice.
- No gradients, no 3D, no heavy shadows in chart space.

---

## 7. Reuse checklist (web & mobile)

1. Copy color/radius/shadow tokens verbatim (sections 2 & 4) — they are plain
   CSS custom properties; port as-is to Tailwind `@theme`, style-dictionary,
   or Figma variables.
2. Ship IBM Plex Sans Arabic (400/500/600/700) self-hosted; never rely on
   system fonts for Arabic text.
3. Keep the RTL discipline: logical properties only (`ms/me/ps/pe/start/end`),
   right-anchored navigation, `dir="ltr"` islands for time charts.
4. Keep the number/locale discipline: Western digits, `tabular-nums`, SAR,
   Gregorian dates.
5. For chart tooling that needs raw hex (Recharts, echarts, Highcharts, iOS
   Charts): use the values in section 2 exactly — they mirror `chartTheme.ts`.
6. Re-run the CVD contrast validation on the status set before any palette
   change; never reintroduce brand red as a status color.
7. Logo: client asset — reuse the PNG for demos/prototypes only; get the
   official vector from the client for production use.
