# shellcheck shell=bash

# rsync="rsync -r --copy-links --delete --perms --human-readable --progress --exclude .git"
rsync="rsync -r --copy-links --delete --perms --human-readable --progress"
# shellcheck disable=SC2139
alias rsync="$rsync"
# shellcheck disable=SC2139
alias sync_dir="rerun --exit --pattern '**/*' -- $rsync ."
unset rsync
