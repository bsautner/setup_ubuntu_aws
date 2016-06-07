export USER="ben"

mkdir /home/$USER/.ssh
chmod 700 home/$USER/.ssh.ssh
touch /home/$USER/.ssh/authorized_keys
chmod 600 /home/$USER/.ssh/authorized_keys
chown ben -R /home/$USER/.ssh
echo "Done setup paste the pub key into above"

deluser ubuntu

git config --global user.email $USER
git config --global user.name "Benjamin Sautner"

#Setup password manager
apt-get -y install pass
pass init $USER
pass git init

#Setup Proxy
sudo apt-get install squid
sudo cp /etc/squid3/squid.conf /etc/squid3/squid.conf.original
sudo chmod a-w /etc/squid3/squid.conf.original
sudo cp -vf ./squid.conf /etc/squid3/squid.conf 




