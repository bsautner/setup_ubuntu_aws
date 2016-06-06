apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -y 
apt-get autoremove -y 
apt-get install ecryptfs-utils -y

keyctl link @u @s
adduser --encrypt-home --disabled-password bsautner


