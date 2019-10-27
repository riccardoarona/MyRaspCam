frame=/usr/src/app/images/frame.jpg
log=/usr/src/app/images/log.txt
# Check active process
if pgrep fbi; then
    pkill fbi;
fi

# If frame file exists, display on HDMI
if test -f "$frame"; then
    fbi -d /dev/fb0 -T 1 -noverbose -a "$frame" >> "$log"
    rm -rf "$frame" >> "$log"
fi

# echo "Complete" >> "$log"