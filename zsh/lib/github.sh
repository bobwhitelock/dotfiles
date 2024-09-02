
alias grip="grip --browser --user \"\$GITHUB_USER\" --pass \"\$GITHUB_PASSWORD\""

# Pass `-R REPO_NAME` to just backup a single repo (much quicker).
alias gh_backup="github-backup bobwhitelock -u bobwhitelock -o ~/github-backups --all --private --skip-archived --token "$GITHUB_CLI_TOKEN_PERSONAL""

gh_login_personal() {
    _gh_login id_rsa.bob "$GITHUB_CLI_TOKEN_PERSONAL"
}

gh_login_rescale() {
    _gh_login id_bob-rescale "$GITHUB_CLI_TOKEN_RESCALE"
}

_gh_login() {
    local gh_key_name gh_cli_token
    gh_key_name="$1"
    gh_cli_token="$2"

    # Restart SSH so key added below will be the only valid key for GitHub in
    # the keychain, otherwise the account that ends up authenticated may be
    # incorrect.
    restart_ssh_agent

    # Authenticate correct account in Git and output verification.
    ssh-add ~/.ssh/"$gh_key_name"
    ssh -T git@github.com

    # Authenticate correct account in GitHub CLI and output verification.
    echo "$gh_cli_token" | gh auth login --with-token
    gh auth status
}
