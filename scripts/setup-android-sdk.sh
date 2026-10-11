#!/usr/bin/env bash
# Installs the Android SDK pieces needed to build an APK (no Android Studio needed).
# Usage: scripts/setup-android-sdk.sh            (installs into $ANDROID_HOME or ~/android-sdk)
set -euo pipefail

ANDROID_HOME="${ANDROID_HOME:-$HOME/android-sdk}"
CMDLINE_TOOLS_ZIP="commandlinetools-linux-13114758_latest.zip"
PLATFORM="platforms;android-35"
BUILD_TOOLS="build-tools;35.0.0"

if ! command -v java >/dev/null; then
  echo "Java 17 or newer is required (install a JDK first)." >&2; exit 1
fi

if [ ! -x "$ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager" ]; then
  echo "Downloading Android command-line tools into $ANDROID_HOME ..."
  mkdir -p "$ANDROID_HOME/cmdline-tools"
  tmp="$(mktemp -d)"
  curl -fsSL "https://dl.google.com/android/repository/$CMDLINE_TOOLS_ZIP" -o "$tmp/tools.zip"
  unzip -q "$tmp/tools.zip" -d "$tmp"
  rm -rf "$ANDROID_HOME/cmdline-tools/latest"
  mv "$tmp/cmdline-tools" "$ANDROID_HOME/cmdline-tools/latest"
  rm -rf "$tmp"
fi

SDKMANAGER="$ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager"
yes | "$SDKMANAGER" --sdk_root="$ANDROID_HOME" --licenses >/dev/null || true
"$SDKMANAGER" --sdk_root="$ANDROID_HOME" "platform-tools" "$PLATFORM" "$BUILD_TOOLS" >/dev/null

echo "Android SDK ready at $ANDROID_HOME"
echo "Before building, run:  export ANDROID_HOME=\"$ANDROID_HOME\""
