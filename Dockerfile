FROM mhart/alpine-node:4
ENV VERSION 1.0

ENV DOCKER_USER="dockerfront"
ENV HOME_DIR=/home/$DOCKER_USER
ENV SRC_DIR=/home/$DOCKER_USER/input
ENV SRC_VENDOR=/home/$DOCKER_USER/vendor

#for bash
RUN apk add --update \
  bash \
  build-base \
  python \
  python-dev && \
  rm -rf /var/cache/apk/* && \
  npm install -g gulp@3.9.0 && \
  addgroup $DOCKER_USER && \
  adduser -s /bin/bash -D -G $DOCKER_USER $DOCKER_USER && \
  mkdir -p $SRC_VENDOR

COPY package.json $SRC_VENDOR/package.json
COPY npm-shrinkwrap.json $SRC_VENDOR/npm-shrinkwrap.json

RUN cd $SRC_VENDOR && \
    chown $DOCKER_USER:$DOCKER_USER -R $SRC_VENDOR && \
    npm install && \
    mkdir $HOME_DIR/config && chown $DOCKER_USER:$DOCKER_USER -R $HOME_DIR/config && \
    mkdir $HOME_DIR/tasks && chown $DOCKER_USER:$DOCKER_USER -R $HOME_DIR/tasks && \
    mkdir $SRC_DIR && chown $DOCKER_USER:$DOCKER_USER -R $SRC_DIR && \
    mkdir $HOME_DIR/output && chown $DOCKER_USER:$DOCKER_USER -R $HOME_DIR/output

VOLUME $HOME_DIR/config
VOLUME $HOME_DIR/tasks
VOLUME $SRC_DIR
VOLUME $HOME_DIR/output

ADD entrypoint.sh /root/entrypoint.sh
RUN chmod +x /root/entrypoint.sh
ENTRYPOINT ["/root/entrypoint.sh"]


