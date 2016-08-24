xhost +local:root >> null
#sudo ~/.xauthDocker.sh
imagename=$1
hostname=${imagename##*/}
echo "Hostname:" $hostname
#XAUTH=/tmp/.docker.xauth
#XAUTH=$HOME/.Xauthority
XSOCK=/tmp/.X11-unix
#xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
#docker run --rm -it --hostname $hostname --name $hostname -e QT_X11_NO_MITSHM=1 -e DISPLAY=$DISPLAY --workdir=/home/caelinux --volume=/home/caelinux:/home/caelinux  -v $XSOCK:$XSOCK -v $XAUTH:/root/.Xauthority -e XAUTHORITY=/root/.Xauthority $imagename /bin/bash
#docker run  --rm -it  --hostname $hostname --name $hostname -e QT_X11_NO_MITSHM=1 -e DISPLAY=$DISPLAY -v /etc/shadow:/etc/shadow -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro -v /etc/sudoers:/etc/sudoers:ro --workdir=$HOME --user $(id -u) -e USER=$USER -e HOME=$HOME -v /tmp:/tmp --volume=$HOME:$HOME -v $XSOCK:$XSOCK $imagename /bin/bash
docker run  --rm -it --hostname $hostname --name $hostname -e QT_X11_NO_MITSHM=1 -e DISPLAY=$DISPLAY --workdir=$HOME -e USER=$USER -e HOME=$HOME -v /tmp:/tmp --volume=$HOME:$HOME -v $XSOCK:$XSOCK $imagename /bin/bash
