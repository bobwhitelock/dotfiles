
alias sshaddbob='ssh-add ~/.ssh/id_rsa.bob'
alias sshaddaws='ssh-add ~/.ssh/aws_ireland.pem'

ssh_remove_last_key() {
    ssh-keygen \
        -f ~/.ssh/known_hosts \
        -R "$(history -n | tail -n 1 | cut -d@ -f2)"
}
