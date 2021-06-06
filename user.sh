export USER="ben"

 
echo $(hostname -I | cut -d\  -f1) $(HOST_NAME) | tee -a /etc/hosts
rm -f /etc/hostname
touch /etc/hostname
bash -c 'echo "sautner.me" >> /etc/hostname'

touch /etc/host
bash -c 'echo "127.0.0.1	pass.sautner.me	pass" >> /etc/host'

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
