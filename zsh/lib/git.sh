
alias git='hub'
alias g='git'
alias gg='git grep --break --heading'
alias gbl='git blame'
alias gb='git branch'
alias gcp='git cherry-pick'
alias gm='git merge'
alias gscp='git am --show-current-patch'

alias ga='git add'
alias gan='ga --intent-to-add'
alias gap='ga -p'

# Functions to push/pull, or try adding key and then doing the same action if
# this fails.
gp() {
    \git push "$@" || (ssh-add ~/.ssh/id_rsa.bob && \git push "$@")
}

gpf() {
    \git push --force-with-lease "$@" || (ssh-add ~/.ssh/id_rsa.bob && \git push --force-with-lease "$@")
}

gpl() {
    \git pull --prune "$@" || (ssh-add ~/.ssh/id_rsa.bob && \git pull --prune "$@")
}

gplr() {
    \git pull --rebase=true "$@" || (ssh-add ~/.ssh/id_rsa.bob && \git pull --rebase=true "$@")
}

alias gd='git diff --color --patch-with-stat'
alias gdc='gd --cached'
alias gds='git diff --color --shortstat'
alias gdcs='gds --cached'

# Grep for files making given change (e.g. `gdgrep TODO`), since we branched
# from `master`.
# XXX Will show both additions and deletions, want to only show additions
# (maybe?)
gdgrep() {
    gd --name-only -G "$@" master
}

alias gst='git stash'
alias gstk='gst save --keep-index'
alias gsti='gst save --include-untracked'
alias gstki='gstk --include-untracked'
alias gstik='gstki'
alias gstl='gst list'

alias gsts='gst show --patch'
alias gsts1='gsts stash@\{1\}'
alias gsts2='gsts stash@\{2\}'
alias gsts3='gsts stash@\{3\}'
alias gsts4='gsts stash@\{4\}'
alias gsts5='gsts stash@\{5\}'
alias gsts6='gsts stash@\{6\}'
alias gsts7='gsts stash@\{7\}'
alias gsts8='gsts stash@\{8\}'
alias gsts9='gsts stash@\{9\}'

alias gsta='gst apply'
alias gsta1='gsta stash@\{1\}'
alias gsta2='gsta stash@\{2\}'
alias gsta3='gsta stash@\{3\}'
alias gsta4='gsta stash@\{4\}'
alias gsta5='gsta stash@\{5\}'
alias gsta6='gsta stash@\{6\}'
alias gsta7='gsta stash@\{7\}'
alias gsta8='gsta stash@\{8\}'
alias gsta9='gsta stash@\{9\}'

alias gc='git commit --verbose'
alias gcm='gc -m'
alias gca='gc --all'
alias gcnv='gc --no-verify' # Skips any `pre-commit` and `commit-msg` hooks.

alias gco='git checkout'
alias gcot='gco --track'

# Fuzz checkout, with preview of latest commit on each branch.
fco() {
    # shellcheck disable=SC2033
    git branch | \
        fzf \
        -1 \
        --query="$*" \
        --preview="echo {} | xargs git show --color=always" | \
        awk '{ print $NF }' | \
        xargs git checkout
}

# Fuzz show, with preview.
fsh() {
    git log \
        --all \
        --pretty=format:'%Cred%H%Creset %an / %cn %s%C(yellow)%d%Creset %Cgreen%ar / %cr%Creset' \
        --color=always | \
        fzf \
        --query="$*" \
        --exact \
        --ansi \
        --preview="echo {} | cut -d' ' -f1 | xargs git show --color=always" \
        --preview-window=top:40% | \
        awk '{ print $1 }' | \
        xargs git show
}

alias gr='git reset'

alias gcf=' git clean -d --force'
alias gci=' git clean -d --interactive'

alias gsh='git show --pretty=fuller --patch-with-stat'
alias gshs='git show --shortstat'
alias gsh~='gsh HEAD~'
alias gsh2='gsh HEAD~2'
alias gsh3='gsh HEAD~3'
alias gsh4='gsh HEAD~4'
alias gsh5='gsh HEAD~5'
alias gsh6='gsh HEAD~6'
alias gsh7='gsh HEAD~7'
alias gsh8='gsh HEAD~8'
alias gsh9='gsh HEAD~9'

# cd to git repo root dir.
alias groot='cd "$(git rev-parse --show-toplevel)"'

# Open Vim and run command from `junegunn/fzf.vim`, for fuzzy finding of all
# commits.
# TODO set `g:fzf_layout` here so this fills screen?
alias gf='vim +Commits'

alias gl="_git_log '%ar / %cr'" # Git log alias with dates relative to now.
alias gli="_git_log '%ai / %ci'" # Git log alias with ISO 8601 dates.
alias gla='gl --all'

_git_log() {
    local dates_format="$1"
    shift

    git log --graph \
        --pretty=format:"%Cred%h%Creset %an: %s%C(yellow)%d%Creset %Cgreen($dates_format)%Creset" \
        --abbrev-commit \
        "$@"
}

alias gbi='git bisect'
alias gbis='gbi start'
alias gbir='gbi reset HEAD'
alias gbib='gbi bad'
alias gbig='gbi good'

alias grec='git rebase --continue'
alias grea='git rebase --abort'
alias gres='git rebase --skip'
alias gre='git rebase'
alias grei='gre --interactive'
alias grei2='grei HEAD~2'
alias grei3='grei HEAD~3'
alias grei4='grei HEAD~4'
alias grei5='grei HEAD~5'
alias grei6='grei HEAD~6'
alias grei7='grei HEAD~7'
alias grei8='grei HEAD~8'
alias grei9='grei HEAD~9'
