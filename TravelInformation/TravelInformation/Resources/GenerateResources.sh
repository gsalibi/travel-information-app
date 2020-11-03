#!/bin/sh/
RSROOT="$SRCROOT/TravelInformation/Resources"

"$PODS_ROOT/SwiftGen/bin/swiftgen" \
 xcassets -t swift5  "$RSROOT/Assets.xcassets" \
 --output "$RSROOT/Assets.swift"

