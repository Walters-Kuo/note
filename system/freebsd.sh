set up a static IP address
sudo ifconfig em0 inet 192.168.1.100 netmask 255.255.255.0
/etc/rc.conf
ifconfig_em0="inet 192.168.1.100 netmask 255.255.255.0"

sudo service netif restart
sudo service netif start em0
