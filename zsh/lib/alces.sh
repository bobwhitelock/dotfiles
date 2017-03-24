
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

ami-creator() {
    local ami_creator_dir ami_type
    ami_creator_dir="$ALCES_PROJECTS"/clusterware-project/imageware/support/aws

    ami_type="$1"
    shift

    (cd "$ami_creator_dir" && \
        ./ami-creator \
        --key-name aws_ireland \
        --branch develop \
        --imageware "$(git rev-parse --abbrev-ref HEAD)" \
        --type "$ami_type" \
        --jfdi \
        --development \
        --fly \
        "$@" \
        ) && domain-vars
}

fly() {
    command fly "$@" && domain-vars
}

# TODO - combine this and `domain-vars`
domain() {
    local default_name
    default_name="$(_default_fly_domain_name)"
    command fly domain status "${1:-$default_name}"
}

_default_fly_domain_name() {
    grep domain: ~/.fly.yml | cut -d' ' -f2
}

# TODO - could (dynamically) load all other domain variables into corresponding
# env vars - e.g.  MONITOR_IP_ADDRESS for monitor IP.
# TODO don't export/load unknown appliance vars?
domain-vars() {
    local domain_status
    # domain_status="$(domain "$1")"
    domain_status="$(domain)"

    MONITORIP="$(_grep_appliance_ip "$domain_status" monitor)"
    DIRECTORYIP="$(_grep_appliance_ip "$domain_status" directory)"
    CONTROLLERIP="$(_grep_appliance_ip "$domain_status" controller)"
    export MONITORIP DIRECTORYIP CONTROLLERIP

    # Cache the domain vars, to be loaded by new shells.
    cat <<EOF | tee "$DOMAIN_VARS_FILE"
MONITORIP="$MONITORIP"
DIRECTORYIP="$DIRECTORYIP"
CONTROLLERIP="$CONTROLLERIP"
EOF
}

_grep_appliance_ip() {
    local domain_status appliance_type
    domain_status="$1"
    appliance_type="$2"

    echo "$domain_status" | \
        grep "$appliance_type" -A 2 | \
        grep 'IP address' | \
        cut -d: -f 2 | \
        xargs
}

# Load cached Flight Attendant domain vars, if present.
cached-domain-vars() {
    source "$DOMAIN_VARS_FILE" 2> /dev/null
    export MONITORIP DIRECTORYIP CONTROLLERIP
}

bobdomain() {
    _use_domain bobdomain
}

bobdomain2() {
    _use_domain bobdomain2
}

_use_domain() {
    local domain_name
    domain_name="$1"
    cp ~/.fly."$domain_name".yml ~/.fly.yml
    domain-vars
}

controller() {
    _ssh_appliance "$CONTROLLERIP"
}

directory() {
    _ssh_appliance "$DIRECTORYIP"
}

monitor() {
    _ssh_appliance "$MONITORIP"
}

_ssh_appliance() {
    local appliance_ip
    appliance_ip="$1"

    # TODO load var if not present
    ssh "dev@$appliance_ip"
}

# Old aliases kept for reference.
alias pscreen='cd ~/alces-portal && screen -dr portal'
alias plog='cd ~/alces-portal && less log/development.log'
alias pconsole='cd ~/alces-portal && bin/rails console'
alias ppostgres='cd ~/alces-portal && psql portal'
alias pdir='cd ~/alces-portal'

alias pvm='sshpass -p alces ssh portalvm'
alias vacsvm='ssh bob@127.0.0.1 -p 9322'
