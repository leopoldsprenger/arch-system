# Fix upside-down hardware cursor rendering
if [[ $(/usr/bin/cat /etc/hostname) == *-vm ]]; then
   export WLR_NO_HARDWARE_CURSORS=1
fi
