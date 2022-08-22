#!/bin/sh
# Usage: run-docker [cmd [arg0 [arg1 ...]]]
# Run any command inside our CI container

# NOTE: Requires $PWD to be under $HOME

image="${IMAGE:-"telosalliance/ubuntu-20.04"}"
tag="${TAG:-"latest"}"

docker run -it --rm \
	--env LINUX_USER="$(id -un)" \
	--env LINUX_UID="$(id -u)" \
	--env LINUX_GROUP="$(id -gn)" \
	--env LINUX_GID="$(id -g)" \
	--env LINUX_DIR="$PWD" \
	--env TERM="$TERM" \
	--mount "src=$HOME,target=$HOME,type=bind" \
	"$image:$tag" "$@"
