#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

VERSION=$(sed -n 's/^ALEKHANA_VERSION=//p' ../versions.mk)
if [ -z "$VERSION" ]; then
    echo "Could not read ALEKHANA_VERSION from versions.mk" >&2
    exit 1
fi

DESTDIR=vendor/alekhana

if [ -f "$DESTDIR/VERSION" ] && [ "$(cat "$DESTDIR/VERSION")" = "$VERSION" ]; then
    exit 0
fi

ASSET="alekhana-macos-v${VERSION}.tar.gz"
URL="https://github.com/deepestblue/alekhana/releases/download/v${VERSION}/${ASSET}"

WORKDIR=$(mktemp -d)
trap 'rm -rf "$WORKDIR"' EXIT

curl -sL -o "$WORKDIR/$ASSET" "$URL"
tar xzf "$WORKDIR/$ASSET" -C "$WORKDIR"
rsync -a --delete "$WORKDIR/alekhana-macos-v${VERSION}/" "$DESTDIR/"
