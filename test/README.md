How to run the test?

cd test

docker run --rm -e DEV_UID=$(id -u) -e DEV_GID=$(id -g) -v $(pwd)/fixture/config:/home/dockerfront/config -v $(pwd)/fixture/tasks/:/home/dockerfront/tasks -v $(pwd)/fixture:/home/dockerfront/input -v $(pwd)/public:/home/dockerfront/output docker-sprites gulp
