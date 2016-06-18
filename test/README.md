## How to run the test?


```shell
cd test

docker run --rm -e DEV_UID=$(id -u) -e DEV_GID=$(id -g) -v $(pwd)/fixture/config:/usr/local/share/config -v $(pwd)/fixture/tasks/:/usr/local/share/tasks -v $(pwd)/fixture:/usr/local/share/input -v $(pwd)/public:/usr/local/share/output micro-sprites gulp
```
