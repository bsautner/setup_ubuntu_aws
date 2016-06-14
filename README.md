### Client Config

* install fuse and sshfs 
* http://osxfuse.github.io
* make the target folder if needed:
* sshfs ben@sautner.me:/data ~/remote -ovolname=remote


* brew install android-sdk
* android update sdk --no-ui --filter 'platform-tools'

### Squid stuff

* tail -f /var/log/squid3/access.log
* curl -x http://sautner.me:8888 google.com
