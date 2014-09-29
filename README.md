```
 ______     __  __     ______     __  __             
/\  ___\   /\ \_\ \   /\  __ \   /\ \/ /             
\ \  __\   \ \____ \  \ \  __ \  \ \  _"-.           
 \ \_____\  \/\_____\  \ \_\ \_\  \ \_\ \_\          
  \/_____/   \/_____/   \/_/\/_/   \/_/\/_/          
                                                     
 ______     ______   ______     ______     __  __    
/\  ___\   /\__  _\ /\  __ \   /\  ___\   /\ \/ /    
\ \___  \  \/_/\ \/ \ \  __ \  \ \ \____  \ \  _"-.  
 \/\_____\    \ \_\  \ \_\ \_\  \ \_____\  \ \_\ \_\ 
  \/_____/     \/_/   \/_/\/_/   \/_____/   \/_/\/_/ 
                                                     
```
---

A set of `Dockerfile`s for developing android apps with Cordova. Especially those that use a full-stack javascript.

...eventually this will have a Yeoman generator to go with it, too.

---

Build from `Dockerfile` or pull from docker.io

	docker pull dougbtv/eyak-base

You can [view on dockerhub, too](https://registry.hub.docker.com/u/dougbtv/eyak-base/).

---

Namesake: Eyak is the name of both a Mountain and a Lake in Cordova, Alaska. And, the [Eyak are also a people](http://en.wikipedia.org/wiki/Eyak).
   
**NB: This is a work in progress**

It will run an emulator in a prohibitively slow manner. But, it'll get an emulator up.

It requires that you share your x11 socket with the docker to use a GUI. For this to work you'll have to allow connection to your X, with:

	xhost +

Check out `runbase.sh` which run:

	docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -i -t dougbtv/eyak-base bin/bash

And then in the container 

Things that need to be done, still:

* Split from base into more useful parts (it's this way for development)
* Can you get that emulator running more quickly? Maybe just as a fallback after it's split up into useful parts?

---                                                                                                 

