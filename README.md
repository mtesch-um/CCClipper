# CCClipper

A macOS menu bar app that clips annoying whitespace from Claude Code terminal copy/pastes.

When you copy code from the Claude Code terminal, it often comes with extra leading indentation and trailing whitespace. CCClipper sits in your menu bar and fixes your clipboard in one click — it strips the common leading indent and trims trailing whitespace from every line.

## Install

```
make install
```

This builds `CCClipper.app`, copies it to `/Applications`, and launches it. A scissors icon appears in your menu bar.

To have it start automatically, add it in **System Settings → General → Login Items**.

## Build & Run

```
make          # build the .app bundle
make run      # build and launch
make clean    # remove build artifacts
```

## Usage

1. Copy text from Claude Code terminal
2. Click the scissors icon in your menu bar → **Clip Annoying Whitespace**
3. Paste the cleaned-up text wherever you need it

Only one instance can run at a time — launching a new one automatically stops the old one.
