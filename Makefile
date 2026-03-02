APP = CCClipper.app
BINARY = clipper
SRC = ClipperApp.swift

all: $(APP)

$(BINARY): $(SRC)
	swiftc -o $@ $< -framework AppKit

$(APP): $(BINARY) Info.plist CCClipper.icns
	mkdir -p $(APP)/Contents/MacOS $(APP)/Contents/Resources
	cp $(BINARY) $(APP)/Contents/MacOS/
	cp Info.plist $(APP)/Contents/
	cp CCClipper.icns $(APP)/Contents/Resources/

run: $(APP)
	open $(APP)

install: $(APP)
	cp -r $(APP) /Applications/
	open /Applications/$(APP)

clean:
	rm -rf $(BINARY) $(APP)

.PHONY: all run install clean
