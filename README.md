## Docker Gulp Sprite
===================

A microservice for generate sprites with a bundle of images

----------


### How to install
-------------

```shell
~ docker build -t micro-sprites . 
```


### Volumes
-------------

This microservice provide the follow volumes:


```shell
/home/dockerfront/input
```

This is the place for the host source

```shell
/home/dockerfront/config
```

This is the place for config files

```shell
/home/dockerfront/tasks
```

This is the place for task files

```shell
/home/dockerfront/output
```

This path needs to be referenced with your output folder host

### How to see a demo
---------------

```shell
clone this repo

cd test

docker run --rm -e DEV_UID=$(id -u) -e DEV_GID=$(id -g) -v $(pwd)/config:/home/dockerfront/config -v $(pwd)/tasks/gulp-sprites:/home/dockerfront/tasks -v $(pwd)/src:/home/dockerfront/input -v $(pwd)/public:/home/dockerfront/output micro-sprites gulp
```

or directly
---------------

```shell
clone this repo

cd test

docker run --rm -e DEV_UID=$(id -u) -e DEV_GID=$(id -g) -v $(pwd)/config:/home/dockerfront/config -v $(pwd)/tasks/gulp-sprites:/home/dockerfront/tasks -v $(pwd)/src:/home/dockerfront/input -v $(pwd)/public:/home/dockerfront/output frontendlabs/micro-sprites gulp
```
