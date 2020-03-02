
PACKAGES_DIR="$DOTFILES/zsh/packages"

source "$PACKAGES_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
# So comments show up, previously they were invisible (see
# https://github.com/zsh-users/zsh-syntax-highlighting/issues/510).
ZSH_HIGHLIGHT_STYLES[comment]='none'

autoload bashcompinit
bashcompinit
for f in "$PACKAGES_DIR"/elm-bash-completion/_*; do
    source "$f"
done

unset PACKAGES_DIR
