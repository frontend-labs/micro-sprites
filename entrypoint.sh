#!/bin/sh

export DOCKER_USER="dockerfront"
export ORIG_PASSWD=$(cat /etc/passwd | grep $DOCKER_USER)
export ORIG_UID=$(echo $ORIG_PASSWD | cut -f3 -d:)
export ORIG_GID=$(echo $ORIG_PASSWD | cut -f4 -d:)

export DEV_UID=${DEV_UID:=$ORIG_UID}
export DEV_GID=${DEV_GID:=$ORIG_GID}
export ENV_SHARED=/usr/local/share

ORIG_HOME=$(echo $ORIG_PASSWD | cut -f6 -d:)

sed -i -e "s/:$ORIG_UID:$ORIG_GID:/:$DEV_UID:$DEV_GID:/" /etc/passwd
sed -i -e "s/$DOCKER_USER:x:$ORIG_GID:/$DOCKER_USER:x:$DEV_GID:/" /etc/group

chown $DOCKER_USER:$DOCKER_USER $ORIG_HOME
chown $DOCKER_USER:$DOCKER_USER $ENV_SHARED

su - $DOCKER_USER -c "
  export ENV_MICROTASK=$ENV_SHARED &&
  cd $ENV_SHARED/tasks/ && $*
"
