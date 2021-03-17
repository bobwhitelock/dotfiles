
# Explain the current rustc error.
rustc_explain() {
    # Word splitting required here for this to work.
    # shellcheck disable=SC2046
    rustc --explain $( \
        cargo build 2>&1 | \
        awk -F 'rustc --explain' '{ print $2 }' | \
        cut -d '`' -f 1
    )
}
