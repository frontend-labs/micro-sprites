## MicroSprite

A microservice for generate sprites with a bundle of images


### How to install

```shell
~ docker build -t micro-sprites . 
```


### Volumes

This microservice provide the follow volumes:


```shell
/usr/local/share/input
```

This is the place for the host source

```shell
/usr/local/share/config
```

This is the place for config files

```shell
/usr/local/share/tasks
```

This is the place for task files

```shell
/usr/local/share/output
```

This path needs to be referenced with your output folder host

### How to see a demo

```shell
clone this repo

cd test

docker run --rm -e DEV_UID=$(id -u) -e DEV_GID=$(id -g) -v $(pwd)/config:/usr/local/share/config -v $(pwd)/tasks/gulp-sprites:/usr/local/share/tasks -v $(pwd)/src:/usr/local/share/input -v $(pwd)/public:/usr/local/share/output micro-sprites gulp
```

or directly

```shell
clone this repo

cd test

docker run --rm -e DEV_UID=$(id -u) -e DEV_GID=$(id -g) -v $(pwd)/config:/usr/local/share/config -v $(pwd)/tasks/gulp-sprites:/usr/local/share/tasks -v $(pwd)/src:/usr/local/share/input -v $(pwd)/public:/usr/local/share/output andru255/micro-sprites gulp
```
