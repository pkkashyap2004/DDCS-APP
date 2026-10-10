# DDCS-APP — Deepak Digital Computer Studio

Flutter + Dart mobile application for Android and iOS. MVC-inspired structure separates models, controllers, services, and views. Supabase/PostgreSQL is the primary backend; Firebase is optional for Analytics, Crashlytics, and push notifications.

## Included
- DDCS branded app shell and menu: Home, About, Store, Gallery, Contact, Account placeholder.
- Animated hero carousel, about section, store catalog, gallery, reviews, contact inquiry form, social links, and Google Maps placeholder.
- Supabase schema migration with Row Level Security policies.
- Environment template, Flutter tests, and GitHub Actions CI.

## Run
1. Install Flutter stable and run `flutter doctor`.
2. Copy `.env.example` to `.env`; set Supabase URL, publishable/anon key, and Google Maps API key.
3. Apply `supabase/migrations/202610100001_initial_schema.sql` in the Supabase SQL Editor.
4. Run `flutter pub get`, then `flutter run`.
5. Configure Firebase only if needed using FlutterFire CLI: `flutterfire configure`.

Never embed Supabase service-role keys or database passwords in a mobile app. The Supabase client key is safe for client use only with correctly configured RLS. Replace placeholder contact details, social links, and map coordinates before release. Configure Google Maps platform keys separately for Android and iOS.

## Layout
`lib/models`, `lib/controllers`, `lib/services`, `lib/views`, `lib/core/widgets`, `lib/core/config`, `lib/core/theme`; `supabase/migrations`; `test`; `.github/workflows`.

## Production checklist
Add authentication/profile flows, admin tooling, anti-spam controls, image storage policies, monitoring, backup/restore checks, privacy policy, data-retention policy, and store compliance before launch. Run `dart format lib test`, `flutter analyze`, and `flutter test` on a Flutter-equipped machine. This scaffold has not been built against platform-specific Android/iOS projects in this environment.