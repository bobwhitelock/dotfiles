
alias git='hub'
alias g='git'
alias gg='git grep'
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
    \git push || (ssh-add ~/.ssh/id_rsa.bob && \git push)
}

gpf() {
    \git push --force-with-lease || (ssh-add ~/.ssh/id_rsa.bob && \git push --force-with-lease)
}

gpl() {
    \git pull --prune || (ssh-add ~/.ssh/id_rsa.bob && \git pull --prune)
}

gplr() {
    \git pull --rebase=true || (ssh-add ~/.ssh/id_rsa.bob && \git pull --rebase=true)
}

alias gd='git diff --color'
alias gdc='gd --cached'
alias gds='gd --shortstat'
alias gdcs='gdc --shortstat'

# Grep for files making given change (e.g. `gdgrep TODO`), since we branched
# from `master`.
gdgrep() {
    gd --name-only -G "$@" master
}

alias gst='git stash'
alias gstk='gst save --keep-index'
alias gsti='gst save --include-untracked'
alias gstki='gstk --include-untracked'
alias gstik='gstki'
alias gsta='gst apply'
alias gsts='gst show --patch'
alias gstl='gst list'

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
        --query="$*" \
        --preview="echo {} | xargs git show --color=always" | \
        awk '{ print $NF }' | \
        xargs git checkout
}

alias gr='git reset'

alias gcf=' git clean -d --force'
alias gci=' git clean -d --interactive'

alias gsh='git show --pretty=fuller'
alias gshs='gsh --shortstat'
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

alias gl="git log \
    --graph \
    --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%ar / %cr)%Creset' \
    --abbrev-commit \
    --date=relative"
alias gla='gl --all'

alias gbi='git bisect'
alias gbis='gbi start'
alias gbir='gbi reset HEAD'
alias gbib='gbi bad'
alias gbig='gbi good'

alias grec='git rebase --continue'
alias grea='git rebase --abort'
alias gres='git rebase --skip'
alias gre='git snapshot pre-rebase && git rebase'
alias grei='gre --interactive'
alias grei2='grei HEAD~2'
alias grei3='grei HEAD~3'
alias grei4='grei HEAD~4'
alias grei5='grei HEAD~5'
alias grei6='grei HEAD~6'
alias grei7='grei HEAD~7'
alias grei8='grei HEAD~8'
alias grei9='grei HEAD~9'
