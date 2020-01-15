#!/usr/bin/env bash
set -e

yarn

yarn release

cd packages/electron-updater

TEMP=`mktemp`

jq '.name = "@ledgerhq/electron-updater" | .repository = "LedgerHQ/electron-builder" | .homepage = "https://github.com/LedgerHQ/electron-builder"' package.json > "$TEMP"

mv -f "$TEMP" package.json

