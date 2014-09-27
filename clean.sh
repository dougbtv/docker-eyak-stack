#!/bin/bash
echo "Kill all containers"
docker kill $(docker ps -a -q)
echo "Removing all containers"
docker rm $(docker ps -a -q)
echo "Removing untagged images"
docker images | grep -i "none" | awk '{print $3}' | xargs docker rmi
echo "Restarting docker service"
systemctl restart docker
