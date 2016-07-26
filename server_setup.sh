export USER="ben"

 
echo $(hostname -I | cut -d\  -f1) $(HOST_NAME) | tee -a /etc/hosts
rm -f /etc/hostname
touch /etc/hostname
bash -c 'echo "sautner.me" >> /etc/hostname'

touch /etc/host
bash -c 'echo "127.0.0.1	central.sautner.me	central" >> /etc/host'

cp -f sshd_config /etc/ssh/sshd_config

apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -y 
apt-get autoremove -y 
apt-get install ecryptfs-utils -y
 
keyctl link @u @s
adduser --disabled-password --gecos "" --force $USER 

#adduser --gecos "" --force $USER 

keyctl unlink @u @s

adduser $USER sudo
bash -c 'echo "$USER ALL=(ALL) NOPASSWD: ALL" | (EDITOR="tee -a" visudo)'


bash -c 'echo "/usr/sbin/logwatch --output mail --mailto bsautner@gmail.com --detail high" >> /etc/cron.daily/00logwatch'

#mount my stuff
mkdir /data
bash -c 'echo "/dev/xvdf1 /data ext4 defaults,nofail 0 2" >> /etc/fstab'
mount -a
chown -R $USER /data

sudo usermod -d /data/home/ben $USER

apt-get -y install fail2ban

apt-get -y install pass
#pass init $USER
#pass git init

#Setup Proxy
apt-get -y install squid
cp /etc/squid3/squid.conf /etc/squid3/squid.conf.original
chmod a-w /etc/squid3/squid.conf.original
cp -vf ./squid.conf /etc/squid3/squid.conf
service squid3 restart
 
   
   

reboot






