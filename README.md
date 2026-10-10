# DDCS-APP — Deepak Digital Computer Studio

Flutter + Dart mobile application for Android and iOS. MVC-inspired structure separates models, controllers, services, and views. Supabase/PostgreSQL is the primary backend; Firebase is intended for optional Analytics, Crashlytics, and push notifications.

## Run from an Android phone (no laptop required)

This repository includes a GitHub Actions cloud build workflow.

1. Open the [DDCS-APP Actions page](https://github.com/pkkashyap2004/DDCS-APP/actions/workflows/android-build.yml) in Chrome and sign in to GitHub.
2. Choose **Build DDCS Android App** → **Run workflow** → **Run workflow**.
3. Open the running workflow and wait for the jobs to finish. If a check fails, open the failing step's log.
4. When successful, open the run's **Artifacts** section and download `ddcs-android-release`. It contains the APK for testing and the AAB for store submission.
5. To install the APK on your phone, download the APK, open it, and allow installation from that source if Android prompts you. Only install your own trusted build.

The workflow generates the Android platform folder in the temporary cloud runner, runs dependency resolution, formatting, static analysis and tests, then builds a release APK and AAB. The generated platform folder is not committed to the repository.

## Configuration

1. Copy `.env.example` to `.env` for local development and set Supabase URL, publishable/anon key, and a restricted Google Maps key.
2. Apply `supabase/migrations/202610100001_initial_schema.sql` in the Supabase SQL Editor.
3. Replace placeholder business phone, email, WhatsApp, social URLs, map coordinates and listing assets before public release.
4. Configure Firebase using FlutterFire CLI when enabling Firebase services. This starter includes Firebase packages but does not yet initialize Firebase or configure push messaging.
5. Configure Google Maps API keys separately for Android and iOS and restrict each key to the correct app.

Never embed Supabase service-role keys or database passwords in a mobile app. Client keys must only be used with correctly configured Row Level Security (RLS).

## Included

- DDCS branded app shell and menu: Home, About, Store, Gallery, Contact, Account placeholder.
- Animated hero carousel, about section, store catalog, gallery, reviews, contact inquiry form, social links and Google Maps placeholder.
- Supabase schema migration with Row Level Security policies.
- Environment template, Flutter tests and GitHub Actions workflows.

## Project layout

`lib/models`, `lib/controllers`, `lib/services`, `lib/views`, `lib/core/widgets`, `lib/core/config`, `lib/core/theme`; `supabase/migrations`; `test`; `.github/workflows`.

## Indus Appstore release

After testing, open the [Indus Appstore Developer Console](https://developer.indusappstore.com/), register/verify the developer account, prepare app listing details and assets, publish an accessible privacy policy, and upload the signed APK/AAB/APKS package. Review is performed by Indus Appstore; publication is not automatic. Keep the release signing key safe and use the same key for updates.

## Production checklist

Add full authentication/profile flows, admin tooling, anti-spam controls, image storage policies, monitoring, backup/restore checks, privacy policy, data-retention policy, Firebase setup, Maps key restrictions and store compliance before launch. Cloud CI must pass and the APK must be installed and tested on a real device before submission.
