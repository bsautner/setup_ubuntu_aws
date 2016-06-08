export USER="ben"


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
sudo service squid3 restart



