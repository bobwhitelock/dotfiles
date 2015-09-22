
export PATH="$PATH:$HOME/bin:/usr/local/bin:$HOME/.rvm/bin"

export EDITOR="vim"
export VISUAL="vim"

# Let git find repos split across filesystems.
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

export DROP="$HOME/Dropbox"

export EH_DATABASE="$DROP/${HOST}.db"

# Set history file depending on if zsh or bash (although bash file will be used
# if in anything other than zsh; doesn't happen currently and don't really care
# about).
if [ -n "$ZSH_VERSION" ]; then
    export HISTFILE="$HOME/.zsh_history"
else
    export HISTFILE="$HOME/.bash_history"
fi
