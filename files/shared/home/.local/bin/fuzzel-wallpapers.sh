#!/usr/bin/env sh

SEARCH_DIR="$HOME/Pictures/wallpapers"
WALLPAPER_CMD="$HOME/.local/bin/wallpaper"

# Wechselt temporär in das Verzeichnis, damit 'find' nur relative Pfade ausgibt
SELECTION="$(cd "$SEARCH_DIR" && find . -not -path '*/.*' -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.webp" -o -name "*.bmp" \) 2>/dev/null | sed 's|^\./||' | fuzzel --dmenu -p "Wallpapers: " -l 20)"
STATUS=$?

if [ $STATUS -ne 0 ] || [ -z "$SELECTION" ]; then
    exit 0
fi

# Setzt den vollen Pfad für die Ausführung wieder zusammen
FULL_PATH="$SEARCH_DIR/$SELECTION"

if [ -f "$FULL_PATH" ]; then
    "$WALLPAPER_CMD" "$FULL_PATH" &
fi

