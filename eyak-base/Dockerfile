# --------------------------------------------------------------------------------------------
#    ______     __  __     ______     __  __     ______     ______     ______     ______    
#   /\  ___\   /\ \_\ \   /\  __ \   /\ \/ /    /\  == \   /\  __ \   /\  ___\   /\  ___\   
#   \ \  __\   \ \____ \  \ \  __ \  \ \  _"-.  \ \  __<   \ \  __ \  \ \___  \  \ \  __\   
#    \ \_____\  \/\_____\  \ \_\ \_\  \ \_\ \_\  \ \_____\  \ \_\ \_\  \/\_____\  \ \_____\ 
#     \/_____/   \/_____/   \/_/\/_/   \/_/\/_/   \/_____/   \/_/\/_/   \/_____/   \/_____/ 
#
# --------------------------------------------------------------------------------------------
# Cordova-Eyak Docker file, base.
# --------------------------------------------------------------------------------------------
# x11 test
# docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -i -t dougbtv/eyak-base xeyes
#
# normal run
# First bring it to bash.
# docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -i -t dougbtv/eyak-base bin/bash
# Then run... 
# emulator -noaudio -avd eyak_nexus_5 -gpu off
# OR
# cd /adt/tools 
# ./emulator -noaudio -avd eyak_nexus_5 -gpu off
# --------------------------------------------------------------------------------------------

FROM fedora:20
MAINTAINER Doug Smith <info@laboratoryb.org>
ENV build_date 2014-09-26

# -------------------- Install Java.
RUN yum update -y 
RUN yum install wget nano java-1.7.0-openjdk-devel -y
# Spare deps for i686 that ADT needs.
RUN yum install -y glibc.i686 glibc-devel.i686 libstdc++.i686 zlib-devel.i686 ncurses-devel.i686 libX11-devel.i686 libXrender.i686 libXrandr.i686

# -------------------- Install Android ADT
RUN yum install -y tar
RUN curl -sf -o /tmp/adt.tgz -L http://dl.google.com/android/android-sdk_r23.0.2-linux.tgz
RUN tar -xzvf /tmp/adt.tgz -C /tmp
RUN mv /tmp/android-sdk-linux /adt
ENV PATH $PATH:/adt/tools:/adt/platforms

# Update it's SDK tools
# Don't forget you can do: `android list sdk`
RUN echo "y" | android update sdk --no-ui --filter 6
RUN echo "y" | android update sdk --no-ui --filter 33

# Now let's make an AVD
# don't forget: `android list targets`
# 		   and: `android list device`
#          and: `android list avd`
# RUN android list targets
RUN android create avd --name eyak_nexus_5 --device "Nexus 5" --target 2

RUN yum install -y SDL.i686 file xorg-x11-xauth xeyes
RUN yum install -y yum install mesa-libGL.i686 mesa-libGL-devel.i686 
RUN yum install -y mesa-libGL-devel 
# RUN ln -s /usr/lib/libGL.so.1 /adt/tools/lib/
# -------------------- Install Cordova
# ENV JAVA_HOME /etc/alternatives/java_sdk_1.7.0
# RUN yum install -y npm
# RUN npm install -g cordova