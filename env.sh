
export PATH="$PATH:$HOME/bin:/usr/local/bin:$HOME/.rvm/bin"

export EDITOR="vim"
export VISUAL="vim"

# Let git find repos split across filesystems.
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

export DROP="$HOME/Dropbox"

# Set history file for current shell to be stored within dropbox directory path
# by hostname, then year/month/day of date, in file with name including current
# time and pid (to avoid collisions). Allows searching all history from
# anywhere (with dotfiles and dropbox). Only do this for zsh to avoid mixing up
# files if in bash etc for some reason.
if [ -n "$ZSH_VERSION" ]; then
    export HISTDIR="$DROP/history/$(hostname)/$(date +%Y/%m/%d)"
    mkdir -p $HISTDIR # Zsh won't create path automatically.
    export HISTFILE="$HISTDIR/$(date +%T)-$$"
else
    export HISTFILE="$HOME/.bash_history"
fi
