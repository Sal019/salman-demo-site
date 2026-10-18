# Salman.dev — Flutter Demo Site

A responsive demo website built with a single Flutter/Dart codebase — the same
code that builds this website also builds an installable Android app (APK).

## What's on the page

- **Header** — Salman.dev branding, menu, and a "Get in touch" button
- **Hero** — "One codebase. Every platform."
- **Stats band** — 1 codebase, 4+ platforms
- **Why Flutter?** — six feature cards (cross-platform, beautiful UI, fast builds, and more)
- **Live interactive demo** — a working Flutter widget: tap the button and the
  counter increments; the card colour can be changed too. Proof the page is a
  real app, not a static HTML page
- **Services & footer** — what can be built next from this same codebase

The layout is responsive and adapts to both mobile and desktop widths.

## Tech

- Flutter 3.47.7 (stable) · Dart 3.13.5
- JDK 21 (Temurin) for the Android build
- One codebase in `lib/main.dart`; platform shells in `web/` and `android/`

## Builds — GitHub Actions

`.github/workflows/build.yml` builds **both** outputs on a GitHub runner:

| Output | Artifact | Built from |
| --- | --- | --- |
| Website | `web-build` (`build/web`) | `flutter build web --release` |
| Android app | `android-apk` (`app-release.apk`) | `flutter build apk --release` |

It runs automatically on every push to `main`, or manually from the repo's
**Actions** tab ("Run workflow"). Download the finished website folder or the
installable APK from the workflow run page.

The cloud build exists because the local machine that created this project
blocks the localhost TCP connection Gradle's daemon needs, so APK builds fail
there — a GitHub runner has no such block. Website builds work in both places.

## Run locally

```bash
flutter pub get
flutter run -d chrome   # website in the browser
flutter build web       # production website -> build/web
flutter build apk       # Android app (needs the Android toolchain)
```
