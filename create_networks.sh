#!/usr/bin/env sh
networks=`docker network ls`

# --attachable is mandatory to be able to connect as we want on these networks
# backend-network is an internal network not reachable from the outside except from nginx
if [ `echo $networks | grep -w backend-network | wc -l` -ne 1 ]; 
then
	echo "backend-network creation"
	docker network create --attachable --internal backend-network
else
	echo "backend-network already exists"
fi;

# frontend-network is a reachable network directly bridge to the host
if [ `echo $networks | grep -w frontend-network | wc -l` -ne 1 ];
then
	echo "frontend-network creation"
	docker network create --attachable frontend-network
else
	echo "frontend-network already exists"
fi;
