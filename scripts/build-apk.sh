#!/usr/bin/env bash
# Builds an Android APK from a Capacitor app folder.
# Usage: scripts/build-apk.sh apps/<name> [debug|release]
#
# debug   (default) installable test build, signed with Android's debug key.
# release           needs these environment variables (keep them in GitHub secrets, never in the repo):
#                   ANDROID_KEYSTORE_BASE64, ANDROID_KEYSTORE_PASSWORD, ANDROID_KEY_ALIAS, ANDROID_KEY_PASSWORD
# The APK is copied to dist/<name>-<mode>.apk
set -euo pipefail

APP_DIR="${1:?usage: scripts/build-apk.sh apps/<name> [debug|release]}"
MODE="${2:-debug}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
NAME="$(basename "$APP_DIR")"
: "${ANDROID_HOME:?ANDROID_HOME is not set. Run scripts/setup-android-sdk.sh first.}"

cd "$ROOT/$APP_DIR"
if [ -f package-lock.json ]; then npm ci; else npm install; fi
npm run build --if-present
[ -d android ] || npx cap add android
npx cap sync android

cd android
chmod +x gradlew
mkdir -p "$ROOT/dist"
if [ "$MODE" = "debug" ]; then
  ./gradlew --no-daemon assembleDebug
  cp app/build/outputs/apk/debug/app-debug.apk "$ROOT/dist/$NAME-debug.apk"
else
  : "${ANDROID_KEYSTORE_BASE64:?}" "${ANDROID_KEYSTORE_PASSWORD:?}" "${ANDROID_KEY_ALIAS:?}" "${ANDROID_KEY_PASSWORD:?}"
  ./gradlew --no-daemon assembleRelease
  BT="$(ls -d "$ANDROID_HOME"/build-tools/* | sort -V | tail -1)"
  ks="$(mktemp)"; trap 'rm -f "$ks"' EXIT
  echo "$ANDROID_KEYSTORE_BASE64" | base64 -d > "$ks"
  "$BT/zipalign" -f -p 4 app/build/outputs/apk/release/app-release-unsigned.apk "$ROOT/dist/$NAME-release.apk"
  "$BT/apksigner" sign --ks "$ks" --ks-pass env:ANDROID_KEYSTORE_PASSWORD \
    --ks-key-alias "$ANDROID_KEY_ALIAS" --key-pass env:ANDROID_KEY_PASSWORD "$ROOT/dist/$NAME-release.apk"
  "$BT/apksigner" verify "$ROOT/dist/$NAME-release.apk"
fi
echo "APK ready: dist/$NAME-$MODE.apk"
