# CCClipper

A macOS menu bar app that clips annoying whitespace from Claude Code terminal copy/pastes.

When you copy code from the Claude Code terminal, it often comes with extra leading indentation and trailing whitespace. CCClipper sits in your menu bar and fixes your clipboard in one click — it strips the common leading indent and trims trailing whitespace from every line.

## Install

Build the app bundle and open it:

```
swiftc -o clipper ClipperApp.swift -framework AppKit
cp clipper CCClipper.app/Contents/MacOS/clipper
open CCClipper.app
```

A scissors icon (✂️) appears in your menu bar. No terminal window.

To have it start automatically, drag `CCClipper.app` into **System Settings → General → Login Items**.

## Build from scratch

```
swiftc -o clipper ClipperApp.swift -framework AppKit
mkdir -p CCClipper.app/Contents/MacOS
cp clipper CCClipper.app/Contents/MacOS/clipper
cp Info.plist CCClipper.app/Contents/Info.plist
```

## Usage

1. Copy text from Claude Code terminal
2. Click the scissors icon in your menu bar → **Clip Annoying Whitespace**
3. Paste the cleaned-up text wherever you need it

Only one instance can run at a time — launching a new one automatically stops the old one.
