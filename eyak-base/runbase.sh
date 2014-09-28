#!/bin/bash
XACL=$(xhost)
if [[ $XACL =~ enabled ]]
then 
   echo "REMINDER: 	This runs an x11 application and you need to run `xhost +`";
   echo "This lets us share the host's x11 connection with this docker container"
fi
echo "For now, run this yourself: emulator -noaudio -avd eyak_nexus_5 -gpu off"
docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -i -t dougbtv/eyak-base bin/bash