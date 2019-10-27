frame=/usr/src/app/frame.jpg

# Check active process
if pgrep fbi; then
    pkill fbi;
fi

# If frame file exists, display on HDMI
if test -f "$frame"; then
    fbi -d /dev/fb0 -T 1 -noverbose -a "$frame"
fi