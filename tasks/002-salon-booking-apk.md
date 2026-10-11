# Task 002: Salon booking Android app (APK)

Status: in progress.
Owner request: "Improve the agents so it can generate apk."

## Agreed scope (from the Project Leader)
- Wrap the Task 001 salon booking page as an Android app with Capacitor (`apps/salon-booking/`).
- Debug APK only, for testing on the owner's phone. Nothing is saved or sent yet.
- App id is a placeholder (`com.example.salonbooking`); the owner picks the real one before any release.
- No Play Store upload and no release signing yet (needs the owner's signing key and Google Play account).

## Plan
1. developer: create the Capacitor app, build `dist/salon-booking-debug.apk` with `scripts/build-apk.sh`.
2. tester: check the APK (app id, version, permissions, signature) and the screens at phone size.
3. security-checker: inspect the APK (not debuggable in release, no secrets, permissions, cleartext off).
4. Project Leader: report to the owner with the APK and install steps.

## Done when
- The APK builds here and on GitHub Actions ("Android APK" workflow).
- Tester PASS and security CLEAR TO SHIP.
- The owner is asked before merging to main.
