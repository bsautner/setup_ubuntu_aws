export USER="ben"
 
echo $(hostname -I | cut -d\  -f1) $(hostname) | tee -a /etc/hosts

apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -y 
apt-get autoremove -y 
apt-get install ecryptfs-utils -y
 
keyctl link @u @s
adduser --disabled-password --gecos "" --force $USER 
keyctl unlink @u @s

adduser $USER sudo
bash -c 'echo "$USER ALL=(ALL) NOPASSWD: ALL" | (EDITOR="tee -a" visudo)'


#mount my stuff
mkdir /data
bash -c 'echo "/dev/xvdf1 /data ext4 defaults,nofail 0 2" >> /etc/fstab'
mount -a
chown -R $USER /data
sudo usermod -d /data/home/ben $USER


apt-get -y install pass
#pass init $USER
#pass git init

#Setup Proxy
sudo apt-get install squid
sudo cp /etc/squid3/squid.conf /etc/squid3/squid.conf.original
sudo chmod a-w /etc/squid3/squid.conf.original
sudo cp -vf ./squid.conf /etc/squid3/squid.conf
sudo service squid3 restart
 
 






