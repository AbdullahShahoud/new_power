# iOS Release — Information Required From the Apple Account

**Purpose of this document.** The repository side of the iOS pipeline is
complete and committed. Nothing further can be built until six values are
collected from your Apple Developer account and your GitHub repository is
configured with them. This document lists exactly what to collect, where to
find it, and what will go wrong if a value is missing or wrong.

Nothing here requires a Mac.

Once every item below is filled in, follow **`README_IOS_RELEASE.md`**.

---

## What is already done in this repository

You do not need to do any of this — it is listed so you can tell what is left.

| Item | State |
| --- | --- |
| `ios/Podfile` | Written, pinned to iOS 15.0 |
| `ios/Runner/Runner.entitlements` | Created, carries `aps-environment` for push |
| `DEVELOPMENT_TEAM` / `CODE_SIGN_STYLE` in `project.pbxproj` | Added to all three Runner configurations, using the `YOUR_TEAM_ID` placeholder |
| `ios/ExportOptions.plist` | Created |
| `.github/workflows/ios_release.yml` | Created |
| `ITSAppUsesNonExemptEncryption` | Set to `false` in `Info.plist` |
| Bundle identifier | `com.newpower.app`, consistent across pbxproj, `GoogleService-Info.plist` and `firebase_options.dart` |
| App display name | `Nawara Alkasser` |

> The `YOUR_TEAM_ID` placeholder is intentional and must stay in the
> repository. CI substitutes it at build time from a secret, which keeps your
> Apple account identifier out of version control. Do not replace it by hand.

---

## Part 1 — Apple Developer Portal

### 1.1 Confirm Developer Program membership

<https://developer.apple.com/account>

You need an active **Apple Developer Program** membership ($99/year). A free
Apple ID cannot distribute to TestFlight or the App Store.

> If enrolment is not complete, start it now. Organisation enrolment requires
> a D-U-N-S number and Apple's verification can take several business days.
> It is the longest lead time in this entire process — everything else takes
> minutes.

---

### 1.2 Collect the Team ID

**Where:** Developer Portal → **Membership details**

**Format:** 10 alphanumeric characters, e.g. `A1B2C3D4E5`

```
APPLE_TEAM_ID = ________________
```

---

### 1.3 Register the App ID — and enable Push

**Where:** Developer Portal → **Certificates, Identifiers & Profiles** →
**Identifiers** → **+** → **App IDs** → **App**

| Field | Value |
| --- | --- |
| Description | `Nawara Alkasser` |
| Bundle ID | **Explicit** → `com.newpower.app` |

Then, in the **Capabilities** list on that same screen, tick:

- [ ] **Push Notifications**

> ### This step is the one most likely to be missed, and its failure is misleading
>
> This app ships `ios/Runner/Runner.entitlements` containing
> `aps-environment`. During the build, `-allowProvisioningUpdates` asks Apple
> to generate a provisioning profile automatically. Apple will only include
> capabilities the App ID actually has.
>
> If Push is not enabled here, Apple issues a profile *without*
> `aps-environment`, the entitlement in the binary then does not match the
> profile, and signing fails with a generic provisioning mismatch error that
> **never mentions push notifications**. You would have no reason to suspect
> this screen.
>
> The bundle ID must be `com.newpower.app` exactly. It is already permanent
> in this codebase and in the Firebase project.

---

### 1.4 Create the APNs authentication key

**Where:** Developer Portal → **Keys** → **+**

| Field | Value |
| --- | --- |
| Key Name | `Nawara Alkasser APNs` |
| Enable | **Apple Push Notifications service (APNs)** |

Download the `.p8` file.

> **This file can be downloaded exactly once.** Save it immediately.

This key is **not** a GitHub secret. It is uploaded to Firebase — see
Part 4. Without it, push notifications build and sign correctly and then
never arrive, with no error anywhere.

---

## Part 2 — App Store Connect

### 2.1 Create the app record

**Where:** <https://appstoreconnect.apple.com> → **Apps** → **+** → **New App**

| Field | Value |
| --- | --- |
| Platform | iOS |
| Name | `Nawara Alkasser` |
| Primary Language | Arabic or English — your choice |
| Bundle ID | `com.newpower.app` (select the App ID from 1.3) |
| SKU | Any internal string, e.g. `nawara-alkasser-ios` |

> The bundle ID only appears in this dropdown after step 1.3. If the list is
> empty, the App ID was not registered.
>
> Uploads fail without this record — the binary has nowhere to land.

---

### 2.2 Create the App Store Connect API key

**Where:** App Store Connect → **Users and Access** → **Integrations** →
**App Store Connect API** → **+**

| Field | Value |
| --- | --- |
| Name | `GitHub Actions CI` |
| Access | **App Manager** |

Record all three of the following. The `.p8` download is **one time only**.

```
APP_STORE_CONNECT_KEY_ID     = ________________   (10 characters)
APP_STORE_CONNECT_ISSUER_ID  = ________________   (UUID format)
AuthKey_<KEY_ID>.p8          → saved to: ________________
```

> This is a **different key** from the APNs key in 1.4. They are not
> interchangeable. This one authenticates the CI upload; that one lets
> Firebase send pushes.

---

## Part 3 — Encode the private key and add GitHub secrets

### 3.1 Base64-encode the `.p8`

The secret must hold the file's **base64 text**, not the file itself.

**Windows (PowerShell):**

```powershell
[Convert]::ToBase64String([IO.File]::ReadAllBytes("AuthKey_XXXXXXXXXX.p8")) | Set-Clipboard
```

**macOS / Linux:**

```bash
base64 -i AuthKey_XXXXXXXXXX.p8 | tr -d '\n'
```

> Do **not** use `certutil -encode`. It wraps the output in
> `-----BEGIN CERTIFICATE-----` markers and hard line breaks, which will not
> decode back to a valid key. The workflow checks for this and fails early
> with an explicit message rather than a confusing authentication error.

---

### 3.2 Add the four secrets

**Where:** GitHub repo → **Settings** → **Secrets and variables** →
**Actions** → **New repository secret**

| Secret name | Value | From |
| --- | --- | --- |
| `APPLE_TEAM_ID` | 10-character team ID | 1.2 |
| `APP_STORE_CONNECT_KEY_ID` | 10-character key ID | 2.2 |
| `APP_STORE_CONNECT_ISSUER_ID` | UUID | 2.2 |
| `APP_STORE_CONNECT_PRIVATE_KEY` | Base64 string from 3.1 | 3.1 |

Names must match exactly — they are read literally by the workflow.

**Optional variable** (Settings → Secrets and variables → Actions →
*Variables* tab, not Secrets):

| Variable | Purpose |
| --- | --- |
| `API_BASE_URL` | Overrides the backend URL. Omit to use `https://gyrostack.cloud/api/v1`. |

---

## Part 4 — Firebase (push delivery)

**Where:** Firebase Console → project `newpower-bgx` → **Project settings** →
**Cloud Messaging** → **Apple app configuration**

- [ ] Upload the **APNs `.p8` key** from 1.4
- [ ] Enter the **Key ID** (from the APNs key, not the API key)
- [ ] Enter the **Team ID** (same value as 1.2)

> Independent of the build. Everything can compile, sign and upload
> successfully with this step skipped — and no push will ever be delivered to
> an iOS device, silently.

---

## Completion checklist

Everything below must be true before starting `README_IOS_RELEASE.md`.

- [ ] Apple Developer Program membership is **active**
- [ ] App ID `com.newpower.app` registered
- [ ] **Push Notifications capability enabled on that App ID**
- [ ] APNs `.p8` key created and saved
- [ ] App record created in App Store Connect
- [ ] App Store Connect API key created with **App Manager** access
- [ ] API `.p8` saved and base64-encoded
- [ ] All four GitHub secrets added, names spelled exactly as above
- [ ] APNs key uploaded to Firebase

---

## Quick reference — the two `.p8` files

Confusing these is a common and time-consuming mistake, because both are
`.p8` files downloadable only once.

| | APNs key (1.4) | API key (2.2) |
| --- | --- | --- |
| Created in | Developer Portal → Keys | App Store Connect → Integrations |
| Purpose | Lets Firebase deliver push | Lets CI upload builds |
| Goes to | Firebase Console | GitHub secret (base64) |
| If missing | Push never arrives, no error | Upload fails with "authentication failed" |
