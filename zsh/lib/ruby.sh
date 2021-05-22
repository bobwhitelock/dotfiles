
alias b='bundle'
alias be='bundle exec'

rake() {
    (groot && maybe_bin_rake "$@")
}

maybe_bin_rake() {
    if [ -f bin/rake ]; then
        bin/rake "$@"
    else
        command rake "$@"
    fi
}

rails() {
    (groot && bin/rails "$@")
}

alias rc='rails console'
alias rds='rails db:setup'
alias rdr='rails db:rollback'
alias rdms='rails db:migrate:status'
alias rdc='rails dbconsole'
alias rdR='rails db:reset'
alias rgm='rails g migration'
alias routes='rails routes'

rdm() {
    if rails -T | grep db:migrate:with_data -q; then
        rails db:migrate:with_data
    else
        rails db:migrate
    fi
}

alias raket='rake -T'
alias rakeall='raket -A'

# Quickly run something with Ruby.
r() {
    ruby -e "p $*"
}
