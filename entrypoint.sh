#!/bin/bash

if [ -n "$JENKINS_DOCKER_SOCKET_GID" ]; then
	sed "s@^docker:x:999:@docker:x:$JENKINS_DOCKER_SOCKET_GID:@" -i /etc/group
fi

exec /sbin/tini -s -- su -c "PATH=$PATH /usr/local/bin/jenkins.sh $@" jenkins
