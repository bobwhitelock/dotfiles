
alias v='vagrant'
alias vs='vagrant status'
alias vup='vagrant up'
alias vssh='vagrant ssh || vagrant up && vagrant ssh'

vagrant-rebuild() {
    vagrant destroy --force && vagrant up --provision
}

# SSH into nth Vagrant VM.
vagrant-ssh() {
    local vm_number port
    vm_number="${1:-1}"
    if [[ $vm_number -eq 1 ]]; then
        port=2222
    else
        port=$((2200 + vm_number - 2))
    fi
    ssh -p "${port}" vagrant@localhost
}

# Forward host port to same port on a Vagrant VM using SSH port forwarding.
vagrant-forward-port() {
    local port vagrant_ssh_port
    port="$1"
    vagrant_ssh_port="${2:-2222}"
    ssh -L "${port}:localhost:${port}" -p "${vagrant_ssh_port}" vagrant@localhost
}
