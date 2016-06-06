export USER="bsautner"

mkdir .ssh
chmod 700 .ssh
touch .ssh/authorized_keys
chmod 600 .ssh/authorized_keys
echo "Done setup paste the pub key into above"
