# CCClipper

A macOS menu bar app that clips annoying whitespace from Claude Code terminal copy/pastes.

When you copy code from the Claude Code terminal, it often comes with extra leading indentation and trailing whitespace. CCClipper sits in your menu bar and fixes your clipboard in one click — it strips the common leading indent and trims trailing whitespace from every line.

## Install

Download the `clipper` binary from this repo and put it somewhere in your PATH, or run it directly:

```
./clipper
```

A scissors icon (✂️) appears in your menu bar.

## Build

```
swiftc -o clipper ClipperApp.swift -framework AppKit
```

## Usage

1. Copy text from Claude Code terminal
2. Click the scissors icon in your menu bar → **Clip Annoying Whitespace**
3. Paste the cleaned-up text wherever you need it
