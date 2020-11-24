
alias shell='./manage.py shell_plus'

urls() {
    local temp_file
    temp_file="$(mktemp)"

    faketty ./manage.py show_urls > "$temp_file"
    "$PAGER" "$temp_file"
}
