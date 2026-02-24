
alias activate='source venv/bin/activate 2>/dev/null || source .venv/bin/activate'
alias shell='./manage.py shell_plus'
alias pyprofile='sudo env PATH="$PATH" py-spy record --subprocesses -o "profile-$(date --iso-8601=seconds).svg"'
alias poetry_cache_clear="rm -rf ~/.cache/pypoetry/"

# Run isolated ipython with given dependencies installed.
itry() {
    uvx --with "$@" ipython
}

# Install a local repo, with fuzz selection, for development/debugging. This
# works best even in a Poetry environment, as Poetry will often hang
# indefinitely (or just take a long time, whereas this is fast) when adding a
# new dependency.
alias pip_install_repo="\$DOTFILES/libexec/fuzz-repo-and-run 'pip install -e'"

# If there is a local venv present when a new shell is started (e.g.
# `add_window` has just been run for a Python project), then activate it.
if [ -f venv/bin/activate ]; then
    # shellcheck disable=SC1091
    activate
fi

urls() {
    local temp_file
    temp_file="$(mktemp)"

    faketty ./manage.py show_urls > "$temp_file"
    bat "$temp_file"
}
