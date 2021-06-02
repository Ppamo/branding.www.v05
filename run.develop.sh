#!/bin/bash

APP=webdev
IMAGE=nginx:1.21

which chcon
echo
[ $? -eq 0 ] && chcon -t svirt_sandbox_file_t $PWD/src/

docker run -ti --name $APP --rm \
	--publish 8080:80 \
	-v $PWD/src:/usr/share/nginx/html:ro \
	$IMAGE
