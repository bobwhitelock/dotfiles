
PACKAGES_DIR="$DOTFILES/zsh/packages"

source "$PACKAGES_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

autoload bashcompinit
bashcompinit
for f in "$PACKAGES_DIR"/elm-bash-completion/_*; do
    source "$f"
done

unset PACKAGES_DIR
