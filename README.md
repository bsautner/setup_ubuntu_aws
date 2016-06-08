### Client Config

* install fuse and sshfs 
* http://osxfuse.github.io
* make the target folder if needed:
* sshfs ben@sautner.me:/data /data -ovolname=remote


### Squid stuff

* tail -f /var/log/squid3/access.log
* curl -x http://sautner.me:8888 google.com
