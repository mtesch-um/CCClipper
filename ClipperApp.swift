import AppKit

class ClipperApp: NSObject, NSApplicationDelegate {
    private var statusItem: NSStatusItem!

    func applicationDidFinishLaunching(_ notification: Notification) {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)

        if let button = statusItem.button {
            button.image = NSImage(
                systemSymbolName: "scissors",
                accessibilityDescription: "Clip clipboard whitespace"
            )
            button.action = #selector(clipClipboard)
            button.target = self
        }

        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Clip Annoying Whitespace", action: #selector(clipClipboard), keyEquivalent: ""))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(quit), keyEquivalent: "q"))
        statusItem.menu = menu
    }

    @objc func clipClipboard() {
        let pasteboard = NSPasteboard.general
        guard let text = pasteboard.string(forType: .string) else { return }

        let lines = text.split(separator: "\n", omittingEmptySubsequences: false).map { String($0) }

        // Find the shortest space prefix among non-empty lines
        let minIndent = lines
            .filter { !$0.allSatisfy(\.isWhitespace) }
            .map { line in line.prefix(while: { $0 == " " }).count }
            .min() ?? 0

        let result = lines
            .map { line in
                if line.allSatisfy(\.isWhitespace) {
                    return ""
                }
                let dedented = String(line.dropFirst(minIndent))
                // Strip trailing whitespace
                var s = dedented
                while s.last?.isWhitespace == true { s.removeLast() }
                return s
            }
            .joined(separator: "\n")

        pasteboard.clearContents()
        pasteboard.setString(result, forType: .string)
    }

    @objc func quit() {
        NSApplication.shared.terminate(nil)
    }
}

let app = NSApplication.shared
app.setActivationPolicy(.accessory)
let delegate = ClipperApp()
app.delegate = delegate
app.run()
