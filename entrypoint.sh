#!/bin/bash

gid=$(stat --printf '%g' /var/run/docker.sock)
sed "s@^docker:x:999:@docker:x:$gid:@" -i /etc/group

exec su jenkins -c "PATH=$PATH /usr/local/bin/jenkins.sh $@"
