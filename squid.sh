export USER="ben"
 
  
apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -y 
apt-get autoremove -y 
 
apt-get -y install squid
cp /etc/squid/squid.conf /etc/squid/squid.conf.original
chmod a-w /etc/squid/squid.conf.original
cp -vf ./squid.conf /etc/squid/squid.conf
cp -vf ./adslist.txt /etc/squid/adslist.txt
service squid restart
  
reboot





