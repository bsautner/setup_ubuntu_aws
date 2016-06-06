export USER="bsautner"
 
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

#su - $USER

echo "please logout and run the following on the client"
echo "ssh-keygen -t rsa -b 4096 -f $USER@$(hostname -I | cut -d\  -f1)"
echo "scp -i \"ubuntu-ws01-kp.pem\" ~/.ssh/ubuntu-ws01.pub  ubuntu@$(hostname -I | cut -d\  -f1):/tmp/ubunut-ws01.pub"
echo "ssh -i \"ubuntu-ws01-kp.pem\" ubuntu@$(hostname -I | cut -d\  -f1)"
echo "cat /tmp/ubunut-ws01.pub >> ~/.ssh/authorized_keys"
 

#mkdir /home/$USER/.ssh
#chown/home/$USER/.ssh $USER
#chmod 700 /home/$USER/.ssh
#touch /home/$USER/.ssh/authorized_keys
#chmod 600 /home/$USER/.ssh/authorized_keys







