frame=/usr/src/app/frame.jpg

# Check active process
if pgrep fbi; then
    pkill fbi;
    sleep .5
fi

# If frame file exists, display on HDMI
if test -f "$frame"; then
    fbi -d /dev/fb0 -T 1 -noverbose -a "$frame"
    sleep 1
    pkill fbi
fi