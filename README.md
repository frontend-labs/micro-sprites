Docker Gulp Sprite
===================

A microservice for generate sprites with a bundle of images

----------


How to install
-------------

> ~ docker build -t docker-sprites . 


Volumes
-------------

This microservice provide the follow volumes:

> ~ /home/dockerfront/input
This is the place for the host source

> ~ /home/dockerfront/config
This is the place for config files

> ~ /home/dockerfront/tasks
This is the place for task files

> ~ /home/dockerfront/output
This path needs to be referenced with your output folder host

How to use
---------------
> docker run --rm -e DEV_UID=$(id -u) -e DEV_GID=$(id -g) -v $(pwd)/config:/home/dockerfront/config -v $(pwd)/tasks/gulp-sprites:/home/dockerfront/tasks -v $(pwd)/src:/home/dockerfront/input -v $(pwd)/public:/home/dockerfront/output docker-sprites gulp

or directly
---------------
> docker run --rm -e DEV_UID=$(id -u) -e DEV_GID=$(id -g) -v $(pwd)/config:/home/dockerfront/config -v $(pwd)/tasks/gulp-sprites:/home/dockerfront/tasks -v $(pwd)/src:/home/dockerfront/input -v $(pwd)/public:/home/dockerfront/output andru255/micro-sprites gulp
