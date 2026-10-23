#!/usr/bin/env sh

TERM_CMD="foot -e"
SEARCH_DIR="$HOME"

SELECTION="$(find "$SEARCH_DIR" -not -path '*/.*' 2>/dev/null | fuzzel --dmenu -p "Files: " -l 20)"
STATUS=$?

if [ $STATUS -ne 0 ] || [ -z "$SELECTION" ]; then
    exit 0
fi

if [ -d "$SELECTION" ]; then
    $TERM_CMD yazi "$SELECTION" &
elif [ -f "$SELECTION" ]; then
    MIME_TYPE="$(file --mime-type -b "$SELECTION")"

    case "$MIME_TYPE" in
        text/* | application/x-zerosize | application/json | application/javascript)
            $TERM_CMD nvim "$SELECTION" &
            ;;
        *)
            handlr open "$SELECTION" &>/dev/null &
            ;;
    esac
fi

