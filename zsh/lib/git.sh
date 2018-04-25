
alias git='hub'
alias g='git'
alias gpl='git pull --prune'
alias gg='git grep'
alias gbl='git blame'
alias gb='git branch'
alias gs='git status -sb'
alias gcp='git cherry-pick'
alias gm='git merge'

alias ga='git add'
alias gap='ga -p'

alias gp='git push'
alias gpf='gp --force-with-lease'

alias gd='git diff --color'
alias gdc='gd --cached'
alias gds='gd --shortstat'
alias gdcs='gdc --shortstat'

alias gst='git stash'
alias gstk='gst save --keep-index'
alias gsti='gst save --include-untracked'
alias gstki='gstk --include-untracked'
alias gsta='gst apply'
alias gsts='gst show --patch'
alias gstl='gst list'

alias gc='git commit --verbose'
alias gcm='gc -m'
alias gca='gc --all'

alias gco='git checkout'
alias gcot='gco --track'

alias gr='git reset'

alias gcf=' git clean --force'
alias gci=' git clean --interactive'

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

# XXX
# --pretty=format:'%Cred%h%Creset %an, %Cgreen%ar%Creset: %s%C(yellow)%d%Creset (%cn, %Cgray%cr%Creset)' \

alias glogf="git log \
    --graph \
    --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%ar / %cr)%Creset' \
    --abbrev-commit \
    --date=relative"
alias glogall='glogf --all'
alias glog='glogf --color=always | head -n 25'

alias gbi='git bisect'
alias gbis='gbi start'
alias gbir='gbi reset HEAD'
alias gbib='gbi bad'
alias gbig='gbi good'

alias gre='git rebase'
alias grec='gre --continue'
alias grea='gre --abort'
alias gres='gre --skip'
alias grei='gre --interactive'
alias grei2='grei HEAD~2'
alias grei3='grei HEAD~3'
alias grei4='grei HEAD~4'
alias grei5='grei HEAD~5'
alias grei6='grei HEAD~6'
alias grei7='grei HEAD~7'
alias grei8='grei HEAD~8'
alias grei9='grei HEAD~9'
