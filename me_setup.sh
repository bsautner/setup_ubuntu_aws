export USER="ben"

mkdir /home/$USER/.ssh
chmod 700 home/$USER/.ssh.ssh
touch /home/$USER/.ssh/authorized_keys
chmod 600 /home/$USER/.ssh/authorized_keys
chown ben -R /home/$USER/.ssh
echo "Done setup paste the pub key into above"

git config --global user.email $USER
git config --global user.name "Benjamin Sautner"


apt-get -y install pass
pass init $USER
pass git init



