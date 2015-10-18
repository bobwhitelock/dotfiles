
export PATH="$PATH:$HOME/bin:/usr/local/bin:$HOME/.rvm/bin"

export EDITOR="vim"
export VISUAL="vim"

# Enable 256 terminal colours (not sure if this will always work).
export TERM='xterm-256color'

# Let git find repos split across filesystems.
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

export DROP="$HOME/Dropbox"

# Set history file depending on if zsh or bash (although bash file will be used
# if in anything other than zsh; doesn't happen currently and don't really care
# about).
if [ -n "$ZSH_VERSION" ]; then
    export HISTFILE="$HOME/.zsh_history"
else
    export HISTFILE="$HOME/.bash_history"
fi
