
alias sshaddbob='ssh-add ~/.ssh/id_rsa.bob'
alias sshaddrescale='ssh-add ~/.ssh/rescale'

ssh_remove_last_key() {
    ssh-keygen \
        -f ~/.ssh/known_hosts \
        -R "$(history -n | tail -n 1 | cut -d@ -f2)"
}

restart_ssh_agent() {
    pkill ssh-agent
    start_or_reuse_ssh_agent
}

start_or_reuse_ssh_agent() {
    # Start ssh-agent and share this between shells. From
    # https://unix.stackexchange.com/a/217223/229081.
    if [ ! -S ~/.ssh/ssh_auth_sock ]; then
      eval `ssh-agent`
      ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
    fi
    export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock

    # ssh-add ~/.ssh/rescale
}
