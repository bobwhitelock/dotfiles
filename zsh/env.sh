
export ZSH_DIR="$DOTFILES/zsh"

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

export PATH="$HOME/bin:/usr/local/bin:/usr/sbin:/sbin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$JAVA_HOME/bin:$HOME/.local/bin:$HOME/.rbenv/bin:/usr/local/go/bin:$HOME/.rvm/bin:./node_modules/.bin:$HOME/.cargo/bin:$PATH"

export TZ='Europe/London'

# As suggested to make Yeoman work in
# https://github.com/creationix/nvm/issues/586#issuecomment-68220064.
# XXX Commented as was being very slow
# export NODE_PATH=$NODE_PATH:"$(npm root -g)"

export EDITOR="vim"
export VISUAL="vim"
export PAGER="less"
export LESS="-K"

# Let git find repos split across filesystems.
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

export STEAM="$HOME/.local/share/Steam"
export STEAMAPPS="$STEAM/steamapps"

export SRC="$HOME/src"
export BOB="$SRC/bobwhitelock"
export NOTES="$BOB/notes"
export GAMES="$BOB/games"
export ALCES="$SRC/alces-software"

# Duplicated from `zshrc` in case source this file directly.
export DOTFILES="$BOB/dotfiles"

export LIBEXEC="$DOTFILES/libexec"

export GITHUB_USER='bobwhitelock'

# Required for Karma to work when Chromium is installed but Chrome isn't.
export CHROME_BIN=chromium

# Set these AWS key variables if the functions exist yet, it doesn't matter if
# they don't though.
# XXX Disable automatically setting these for now to require explicit setting,
# to avoid accidentally using variables for wrong account (again).
# export AWS_ACCESS_KEY_ID=$(aws_access_key 2> /dev/null)
# export AWS_SECRET_ACCESS_KEY=$(aws_secret_key 2> /dev/null)

export DOMAIN_VARS_FILE=/tmp/domain-vars
# cached-domain-vars 2> /dev/null

export ZSH_LIB="$ZSH_DIR/lib"

export DOTFILES_PRIVATE="$BOB/dotfiles-private"
export ZSH_PRIVATE_LIB="$DOTFILES_PRIVATE/zsh/lib"

# See http://vim.wikia.com/wiki/Using_vim_as_a_man-page_viewer_under_Unix.
export MANPAGER="/bin/sh -c \"unset MANPAGER;col -b -x | \
    vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

export M2_HOME='/opt/maven/'

export SHELLCHECK_OPTS='--shell=bash'

# Make ipdb (which uses IPython) the default Python debugger.
export PYTHONBREAKPOINT=ipdb.set_trace

# Load private environment variables if present.
# shellcheck disable=SC1090
source "$ZSH_DIR/env.private.sh" 2> /dev/null

export LINODE_CLI_TOKEN="$LINODE_TOKEN"
