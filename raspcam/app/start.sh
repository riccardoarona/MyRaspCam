# Start sshd if we don't use the init system
if [ "$INITSYSTEM" != "on" ]; then

    echo "configuring SSH ..."
    mkdir /var/run/sshd \
        && echo 'root:resin' | chpasswd \
        && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
        && sed -i 's/UsePAM yes/UsePAM no/' /etc/ssh/sshd_config

    echo "starting SSH ..."
    /usr/sbin/sshd -p 22 &
fi

echo "rendering image"
# cat /usr/src/app/images/image.raw > /dev/fb1
fbi -d /dev/fb0 -T 1 -noverbose -a ./images/raspberry-pi-logo.png

echo "waiting 1 second"
sleep 1

echo "killing fbi"
pkill fbi

# Notifying service start
echo "starting service ..."
python3 /usr/src/app/server.py

