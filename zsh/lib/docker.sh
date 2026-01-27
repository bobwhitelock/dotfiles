# shellcheck shell=bash

docker_debug() {
    local container_hash debug_name
    container_hash="$1"

    debug_name="debug-container-$RANDOM"
    docker commit "$container_hash" "$debug_name"
    docker run -ti --rm "$debug_name" bash
}
