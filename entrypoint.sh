#!/bin/sh

export DOCKER_USER="dockerfront"
export ORIG_PASSWD=$(cat /etc/passwd | grep $DOCKER_USER)
export ORIG_UID=$(echo $ORIG_PASSWD | cut -f3 -d:)
export ORIG_GID=$(echo $ORIG_PASSWD | cut -f4 -d:)

export DEV_UID=${DEV_UID:=$ORIG_UID}
export DEV_GID=${DEV_GID:=$ORIG_GID}

ORIG_HOME=$(echo $ORIG_PASSWD | cut -f6 -d:)

sed -i -e "s/:$ORIG_UID:$ORIG_GID:/:$DEV_UID:$DEV_GID:/" /etc/passwd
sed -i -e "s/$DOCKER_USER:x:$ORIG_GID:/$DOCKER_USER:x:$DEV_GID:/" /etc/group

ln -s $ORIG_HOME/vendor/node_modules $ORIG_HOME/tasks/node_modules
su - $DOCKER_USER -c "cd $ORIG_HOME/tasks && $*"
rm -fr $ORIG_HOME/tasks/node_modules
