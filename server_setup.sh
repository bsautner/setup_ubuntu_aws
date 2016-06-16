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
#adduser --disabled-password --gecos "" --force $USER 

adduser --gecos "" --force $USER 

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
#apt-get -y install squid
#cp /etc/squid3/squid.conf /etc/squid3/squid.conf.original
#chmod a-w /etc/squid3/squid.conf.original
#cp -vf ./squid.conf /etc/squid3/squid.conf
#service squid3 restart
 
  
sudo cp /data/.certs/cacert.pem /etc/ssl/certs/
sudo cp /data/.certs/cakey.pem /etc/ssl/private/

sudo apt-get -y install libsasl2-2 sasl2-bin libsasl2-modules

cp -fv ./saslauthd /etc/default/saslauthd

sudo dpkg-statoverride --force --update --add root sasl 755 /etc/default/saslauthd
sudo ln -s /etc/default/saslauthd /etc/saslauthd

sudo apt-get -y install mailutils
sudo adduser ben mail
sudo touch /var/mail/ben
sudo chmod ug+rw /var/mail/ben
 
#sudo apt-get -y install dovecot-imapd dovecot-pop3d
#cp dovcot.config /etc/dovcot/
apt-get -y install courier-imap courier-imap-ssl courier-pop courier-pop-ssl

maildirmake /etc/skel/Maildir
maildirmake /etc/skel/Maildir/.Drafts
maildirmake /etc/skel/Maildir/.Sent
maildirmake /etc/skel/Maildir/.Trash
maildirmake /etc/skel/Maildir/.Templates

cp -r /etc/skel/Maildir /data/home/ben/
chown -R myuser:usergroup /data/home/ben/Maildir
chmod -R 700 /data/home/ben/Maildir

reboot






