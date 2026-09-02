# iOS Release — Build and Submit

**Prerequisite:** every box in `README_IOS_SETUP.md` is ticked. If the Apple
account information is not yet collected, start there.

This document covers what to do once it is: running the first build,
stabilising it, and submitting to the App Store. No Mac is required at any
point.

---

## How the pipeline works

```
  You (Windows)                GitHub Actions (macOS runner)         Apple
  ─────────────                ─────────────────────────────         ─────
  Run workflow  ──────────────▶ flutter pub get
                                pod install
                                decode API key  ◀── secrets
                                inject Team ID  ◀── secrets
                                flutter build ipa --no-codesign
                                xcodebuild -exportArchive ──────────▶ issues
                                  (automatic signing)                 profile
                                altool --validate-app  ─────────────▶ checks
                                altool --upload-app  ───────────────▶ TestFlight
                                upload artifacts
                                  ├── IPA
                                  ├── debug symbols
                                  └── Podfile.lock
```

The runner is disposable: it is created for the build and destroyed after.
Nothing persists between runs except what the workflow uploads as artifacts.

---

## Step 1 — Commit and push

The workflow only exists on GitHub once pushed.

```bash
git add .github/workflows/ios_release.yml ios/ExportOptions.plist \
        ios/Podfile ios/Runner/Runner.entitlements \
        ios/Runner.xcodeproj/project.pbxproj \
        README_IOS_SETUP.md README_IOS_RELEASE.md
git commit -m "ci: add iOS release pipeline"
git push
```

---

## Step 2 — Run the first build

GitHub → **Actions** → **iOS Release → TestFlight** → **Run workflow**

**On the first run, set `upload` to `false`.**

The goal of run one is to find out whether the project compiles and signs on
a Mac at all — something that has never been tested, because this project has
no macOS history. Uploading a build you have not yet proven can be built adds
a second class of failure to diagnose at the same time.

Expected duration: **12–20 minutes**.

> ### Expect the first run to fail
>
> This is normal and not a sign the setup is wrong. Three things are being
> exercised for the very first time: CocoaPods resolution against a Podfile
> that has never run, an iOS 15.0 deployment target that has never been
> compiled, and automatic signing against a newly created App ID. See
> **Troubleshooting** below — each likely failure has a specific, known fix.

---

## Step 3 — Commit `Podfile.lock`

Once a run gets past **Install CocoaPods dependencies**, whether or not later
steps passed:

1. Open the run → **Summary** → **Artifacts**
2. Download **`podfile-lock-<n>`**
3. Place `Podfile.lock` in `ios/`
4. Commit it:

```bash
git add ios/Podfile.lock
git commit -m "ci: pin CocoaPods dependency versions"
git push
```

> Do this early. Until it is committed, every run re-resolves pods from
> scratch, so an upstream release can break a build that worked yesterday
> with no change of yours — and the failure will look like your bug.

---

## Step 4 — Verify the build before uploading

Download the **`ipa-build-<n>`** artifact and confirm it exists and is a
plausible size (roughly 40–80 MB for this app).

If you have an iPhone, the real verification happens in Step 5 via TestFlight.

> **Note on browser-based simulators.** Services such as Appetize.io require
> a **simulator** build. The IPA produced here is a device build signed for
> distribution and will not run on them. TestFlight on physical hardware is
> the only way to test this artifact.

---

## Step 5 — Upload to TestFlight

Run the workflow again, this time with **`upload` set to `true`**.

The workflow validates the binary before uploading, which catches most
rejection reasons in about a minute instead of after a full upload and
Apple's processing queue.

After a successful upload:

1. App Store Connect → **Apps** → **Nawara Alkasser** → **TestFlight**
2. The build shows **Processing** for 5–15 minutes
3. It becomes **Ready to Test** with no export-compliance prompt, because
   `ITSAppUsesNonExemptEncryption` is already declared in `Info.plist`

Add yourself under **Internal Testing** to install it via the TestFlight app.

---

## Step 6 — Test on a real device

Push notifications and maps cannot be verified any other way. At minimum:

- [ ] App launches; brand picker appears on first run
- [ ] Login succeeds
- [ ] **Push notification arrives** — send a test from the Firebase console
- [ ] **Map renders** in the project location picker
- [ ] Camera, photo library, microphone and location prompts each appear with
      the correct app name and a sensible reason
- [ ] Arabic and English both render correctly, including right-to-left layout

> **Maps on iOS uses a separate API key** from Android — it is hardcoded in
> `ios/Runner/AppDelegate.swift`. If the map is blank, restrict/verify that
> key in Google Cloud Console for bundle ID `com.newpower.app` and the
> **Maps SDK for iOS**. This is the same class of problem already resolved on
> Android, and it does not carry over.

---

## Step 7 — Submit for review

App Store Connect → your app → **Distribution**.

Required before the Submit button becomes available:

- [ ] **Screenshots** — 6.7" iPhone required; 6.5" and 12.9" iPad if iPad is
      a supported destination
- [ ] **Description, keywords, support URL, marketing URL**
- [ ] **Privacy Policy URL** — must be publicly reachable over HTTPS
- [ ] **App Privacy questionnaire** — this app collects precise location,
      photos, audio, files, name/email/phone, a derived device identifier and
      FCM tokens. Declare all of them.
- [ ] **Age rating**
- [ ] **Sign-in required** → **Yes**, with a working demo account

> ### The demo account is not optional here
>
> Registration in this app requires a `managerCode` (`SM-XXXXXXXX`). A
> reviewer cannot create their own account, so without working credentials
> the submission is rejected as "unable to review" — a rejection that costs a
> full review cycle.
>
> In **App Review Information**, also explain in a sentence or two that this
> is an internal B2B tool for construction sales representatives, and which
> features need location, camera and microphone. Reviewers reject permission
> requests whose purpose is not obvious.

**Still outstanding from the release plan** — both stores require in-app
account deletion for any app offering account creation, and this app has
none. It needs a backend endpoint first. Expect rejection under Guideline
5.1.1(v) until it exists.

---

## Versioning

| Value | Source | Behaviour |
| --- | --- | --- |
| Build number (`CFBundleVersion`) | `github.run_number` | Increments automatically every run |
| Version (`CFBundleShortVersionString`) | `version:` in `pubspec.yaml` | Currently `1.0.0` — bump by hand for each release |

`manageAppVersionAndBuildNumber` is set to `false` in `ExportOptions.plist`
so Xcode cannot rewrite the build number chosen by CI. Leave it that way; the
alternative is uploading a number you did not pick and being unable to
explain a "redundant binary" rejection.

---

## Debug symbols — read this before the first upload

The build passes `--obfuscate`, which renames every symbol. The matching
symbol files are uploaded as the **`debug-symbols-<n>`** artifact.

**Download and archive them somewhere durable for every build you ship.**

They cannot be regenerated: a later rebuild produces different symbols. Without
the exact set for a given build, every Crashlytics report from that build is
permanently unreadable. GitHub deletes artifacts after 90 days.

---

## Troubleshooting

| Failure | Cause | Fix |
| --- | --- | --- |
| `YOUR_TEAM_ID placeholder still present` | `APPLE_TEAM_ID` secret missing or misspelled | Add it exactly as named in the setup doc |
| `did not decode to a PEM private key` | `.p8` encoded with `certutil`, or line breaks in the secret | Re-encode with the PowerShell command in the setup doc |
| `Signing for "Runner" requires a development team` | Team ID injected but App ID not registered | Complete setup step 1.3 |
| Provisioning profile mismatch / missing entitlement | **Push Notifications not enabled on the App ID** | Complete setup step 1.3's capability checkbox, then re-run |
| `No profiles for 'com.newpower.app' were found` | App ID not registered, or API key lacks App Manager access | Check setup steps 1.3 and 2.2 |
| CocoaPods resolution fails on deployment target | A pod requires a higher iOS version than 15.0 | Raise `platform :ios` in `ios/Podfile` **and** the `post_install` block, which must match |
| `altool: Authentication failed` | Key ID / Issuer ID mismatch, or filename wrong | The file must be `AuthKey_<KEY_ID>.p8` with the ID matching the secret exactly |
| `Redundant binary upload` | Build number already used | Re-run the workflow; `github.run_number` will have advanced |
| Build succeeds, no push on device | APNs key not uploaded to Firebase | Complete setup Part 4 |
| Build succeeds, map is blank | iOS Maps key not restricted for this bundle ID | Google Cloud Console → restrict the iOS key to `com.newpower.app` + Maps SDK for iOS |

---

## Cost note

macOS runners bill at **10× the Linux rate** on private repositories. A build
is roughly 15 minutes ≈ 150 billed minutes. The free tier for a Pro account is
3,000 minutes/month, so about 20 iOS builds per month before charges. This is
why the workflow is manual-trigger only rather than running on every push.
