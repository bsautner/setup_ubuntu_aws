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

#

echo "please logout and run the following on the client"
echo "ssh-keygen -t rsa -b 4096 -f $USER@$(hostname -I | cut -d\  -f1)"
echo "scp -i \"ubuntu-ws01-kp.pem\" ~/.ssh/ubuntu-ws01.pub  ubuntu@$(hostname -I | cut -d\  -f1):/tmp/ubunut-ws01.pub"
echo "ssh -i \"ubuntu-ws01-kp.pem\" ubuntu@$(hostname -I | cut -d\  -f1)"
echo "cat /tmp/ubunut-ws01.pub >> ~/.ssh/authorized_keys"
 
cd /home/$USER
git clone https://github.com/bsautner/setup_ubuntu_aws.git
su - $USER
exit
 






