
export DOTFILES="$HOME/.dotfiles"
source "$DOTFILES/env.sh"

# Oh My Zsh stuff.
ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true" # Use case-sensitive completion.
DISABLE_AUTO_UPDATE="true" # Don't nag about updates.
plugins=(history-substring-search httpie rvm rails rust tmuxinator vagrant)
export ZSH=$DOTFILES/oh-my-zsh
source $ZSH/oh-my-zsh.sh
unalias -m '*' # Get rid of Oh my Zsh aliases polluting shell.

# Disable Software Flow Control for when I accidentally hit C-s.
# (see http://unix.stackexchange.com/a/72092).
stty -ixon

# Check existence of setxkbmap so doesn't break without X.
# TODO Doesn't actually work, get message about cannot open display default
# display; is $DISPLAY set, on machine with X but not available
command -v setxkbmap >/dev/null 2>&1
if [ $? ]; then
  # Ensure correct keyboard layout.
  setxkbmap gb
fi

unsetopt share_history

# Allow interactive comments and alt-#, as in bash.
setopt interactive_comments
bindkey -M emacs '\e#' pound-insert

# Make ctrl-z run fg as well as backgrounding
# (from http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/).
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

source "$DOTFILES/aliases.sh"

# For advanced shell history.
export ASH_LOG_BIN=/usr/local/bin/_ash_log.py
source /usr/lib/advanced_shell_history/zsh
unset ASH_CFG_MOTD # Don't show message at shell start.

# Enable thefuck.
eval "$(thefuck --alias)"

export NVM_DIR="/home/bob/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Enable FZF.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Source this again to set up things depending on earlier parts of this file,
# e.g. on aliases, and ensure no variables are mysteriously clobbered.
source "$DOTFILES/env.sh"
