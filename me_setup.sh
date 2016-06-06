export USER="ben@sautner.me"

mkdir .ssh
chmod 700 .ssh
touch .ssh/authorized_keys
chmod 600 .ssh/authorized_keys
echo "Done setup paste the pub key into above"

apt-get -y install pass
pass init 
pass git init
git config --global user.email $USER
git config --global user.name "Benjamin Sautner"


