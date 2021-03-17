
# Run https://github.com/joshuaclayton/unused via Docker, without needing to
# install locally.
unused_docker() {
    sudo systemctl start docker && \
        sudo docker run --rm -it -v "$(pwd)":/code joshuaclayton/unused unused "$@"
}
