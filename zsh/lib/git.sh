# shellcheck shell=bash

alias g='git'
alias gg='git grep --break --heading'
alias gbl='git blame'
alias gb='git branch'
alias gcp='git cherry-pick'
alias gscp='git am --show-current-patch'

alias gm='git merge'
alias gmf='gm --ff-only'

alias ga='git add'
alias gan='ga --intent-to-add'
alias gap='ga -p'

# "quick commit" all changes to current repo.
qc() {
    git add . && git commit "$@" -m 'Add/do some things' && git push
}

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
alias gds='git diff --color --stat'
alias gdcs='gds --cached'

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

# Create new/move existing branch to current HEAD and check this out, whether
# it exists already or not.
gcof() {
    gco -b "$@" || (gb -f "$@" && gco "$@")
}

# Run given Git subcommand, with fuzz select of branch/tag/SHA to pass as
# argument, and preview of latest commit for selected item.
# Usage: `fgit SUBCOMMAND [FZF_ARGS]`
fgit() {
    local subcommand
    subcommand="$1"
    shift

    # shellcheck disable=SC2033
    ( git branch ; git tag ; git log --format="%H") | \
        fzf \
        -1 \
        --query="$*" \
        --preview="echo {} | xargs git show --color=always" | \
        awk '{ print $NF }' | \
        xargs git "$subcommand"
}

# Aliases using above.
alias fco="fgit checkout"
alias fl="fgit log"

# Fuzz show, with preview.
fsh() {
    # shellcheck disable=SC2033
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

# Fuzz running of my history alias, on files with local changes, with `git
# diff` as preview.
fhistory() {
    git status --porcelain | \
        grep -v '??' | \
        xargs -L1 | \
        cut -d' ' -f2 | \
        fzf \
        --query="$*" \
        --ansi \
        --preview="echo {} | xargs git diff --color=always" \
        --preview-window=top:60% | \
        xargs git history
}

alias gr='git reset'

alias gci='git clean -d --interactive'

alias gsh='git show --pretty=fuller --patch-with-stat'
alias gshs='git show --stat'
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

alias gl="\$DOTFILES/libexec/git-log '%ar / %cr'" # Git log alias with dates relative to now.
alias gli="\$DOTFILES/libexec/git-log '%ai / %ci'" # Git log alias with ISO 8601 dates.
alias gld="\$DOTFILES/libexec/git-log '%ad / %cd'" # Git log alias with full dates including day of week.
alias gla='gl --all'

alias gbi='git bisect'
alias gbis='gbi start'
alias gbir='gbi reset HEAD'
alias gbib='gbi bad'
alias gbig='gbi good'

alias grec='git rebase --continue'
alias great='git rebase --abort'
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
alias grein='grei --no-autosquash'

# TODO BW 2025-06-13: Split this out to a separate script so that it doesn't
# blindly continue if one of the commands fails.
gre_on_latest() {
    local branch="$1"
    shift
    git checkout "$branch"
    git pull --ff-only
    git checkout -
    git rebase "$@" "$branch"
}

# Completion for `gre_on_latest`.
_gre_on_latest() {
    if [[ $CURRENT -eq 2 ]]; then
        # Only suggest rebasing on one of these branches, when they exist, as
        # this is almost always what I want.
        local -a branches
        # shellcheck disable=SC2207 # Auto-suppressed when enabling Shellcheck.
        branches=($(
            git for-each-ref --format='%(refname:short)' refs/heads/ |
            grep -E '^(main|master|candidate|release)$'
        ))
        # shellcheck disable=SC2068 # Auto-suppressed when enabling Shellcheck.
        compadd -- ${branches[@]}
    else
        # Only suggest these 2 `rebase` options or nothing, as these are the
        # only ones I actually use in this context.
        compadd '' --no-autosquash --interactive
    fi
}
compdef _gre_on_latest gre_on_latest
