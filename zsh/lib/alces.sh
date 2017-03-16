
# Get AWS keys from Dropbox.
alias aws_access_key='cut -d "," -f 2 $DROP/bob-alces-aws-credentials.csv | tail -n 1'
alias aws_secret_key='cut -d "," -f 3 $DROP/bob-alces-aws-credentials.csv | tail -n 1'

# Kill/clean any running/leftover Clusterware sessions.
alces_kill_all_sessions() {
    for i in $(alces session list | cut -d ' ' -f 2 | tail -n +4 | head -n -1); do
        alces session kill "$i"
    done
    alces session clean
}

domain() {
    local default_name
    default_name="$(_default_fly_domain_name)"
    fly domain status "${1:-$default_name}"
}

_default_fly_domain_name() {
    grep domain: ~/.fly.yml | cut -d' ' -f2
}

# TODO - could (dynamically) load all other domain variables into corresponding
# env vars - e.g.  MONITOR_IP_ADDRESS for monitor IP.
domain-vars() {
    local domain_status
    domain_status="$(domain "$1")"

    MONITORIP="$(echo "$domain_status" | grep monitor -A 2 | grep 'IP address' | cut -d: -f 2 | xargs)"
    DIRECTORYIP="$(echo "$domain_status" | grep directory -A 2 | grep 'IP address' | cut -d: -f 2 | xargs)"
    export MONITORIP DIRECTORYIP

    # Cache the domain vars, to be loaded by new shells.
    cat <<EOF > "$DOMAIN_VARS_FILE"
MONITORIP="$MONITORIP"
DIRECTORYIP="$DIRECTORYIP"
EOF
}

# Load cached Flight Attendant domain vars, if present.
cached-domain-vars() {
    source "$DOMAIN_VARS_FILE" 2> /dev/null
}

# Old aliases kept for reference.
alias pscreen='cd ~/alces-portal && screen -dr portal'
alias plog='cd ~/alces-portal && less log/development.log'
alias pconsole='cd ~/alces-portal && bin/rails console'
alias ppostgres='cd ~/alces-portal && psql portal'
alias pdir='cd ~/alces-portal'

alias pvm='sshpass -p alces ssh portalvm'
alias vacsvm='ssh bob@127.0.0.1 -p 9322'
