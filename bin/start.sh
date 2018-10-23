#!/bin/bash

source log-func.sh

function usage {
    cat <<EOF

Usage: $0 image-name container-name work-directory

EOF
}

if [ "$#" -ne 3 ]; then
	usage
    exit 1
fi

IMAGE="$1"
CONTAINER="$2"
YOCTODIR=$(readlink -m "$3")
USER=$(whoami)

INFO "Using $IMAGE image"
INFO "Using $CONTAINER container"
INFO "Using $YOCTODIR as the yocto work space"

INFO "Creating container $CONTAINER"
    docker run -it \
		-p 8000:8000 \
		--volume="$YOCTODIR:/yocto" \
        --volume="${HOME}/.ssh:/home/${USER}/.ssh" \
        --volume="${HOME}/.gitconfig:/home/${USER}/.gitconfig" \
        --volume="/etc/localtime:/etc/localtime:ro" \
        --env="DISPLAY" \
        --env="QT_X11_NO_MITSHM=1" \
        --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
        --env=HOST_UID=$(id -u) \
        --env=HOST_GID=$(id -g) \
        --env=USER=${USER} \
        --name=$CONTAINER \
        $IMAGE

# bye
exit $?
