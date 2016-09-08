
export PATH="$PATH:$HOME/bin:/usr/local/bin:$HOME/.rvm/bin:./node_modules/.bin:$HOME/.cargo/bin"

# As suggested to make Yeoman work in
# https://github.com/creationix/nvm/issues/586#issuecomment-68220064.
export NODE_PATH=$NODE_PATH:"$(npm root -g)"

export EDITOR="vim"
export VISUAL="vim"

# Let git find repos split across filesystems.
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

export DROP="$HOME/Dropbox"

# Set history file depending on if zsh or bash (although bash file will be used
# if in anything other than zsh; doesn't happen currently and don't really care
# about).
if [ -n "$ZSH_VERSION" ]; then
    export HISTFILE="$DROP/.zsh_history"
else
    export HISTFILE="$DROP/.bash_history"
fi

# Effectively store unlimited history.
export HISTSIZE=999999999
export SAVEHIST=$HISTSIZE

export PROJECTS="$HOME/projects"
export ALCES_PROJECTS="$PROJECTS/alces"
export OTHER_PROJECTS="$PROJECTS/other"

export GITHUB_USER='bobwhitelock'

# Required for Karma to work when Chromium is installed but Chrome isn't.
export CHROME_BIN=chromium
