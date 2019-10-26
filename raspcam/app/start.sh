# Start sshd if we don't use the init system
if [ "$INITSYSTEM" != "on" ]; then
    echo "starting SSH ..."
    /usr/sbin/sshd -p 22 &
fi

echo "rendering image"
# cat /usr/src/app/images/image.raw > /dev/fb1
fbi -d /dev/fb0 -T 1 -noverbose -a ./client/favicon.png

sleep 999

# Notifying service start
echo "starting service ..."
python3 /usr/src/app/server.py

