#!/bin/bash
XACL=$(xhost)
if [[ $XACL =~ enabled ]]
then 
   echo "REMINDER: 	This runs an x11 application and you need to run `xhost +`";
   echo "This lets us share the host's x11 connection with this docker container"
fi