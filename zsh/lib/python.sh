
alias activate='source venv/bin/activate'
alias shell='./manage.py shell_plus'

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
