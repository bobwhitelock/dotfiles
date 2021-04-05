
alias b='bundle'
alias be='bundle exec'

alias rc='bin/rails console'
alias rdr='bin/rails db:rollback'
alias rdms='bin/rails db:migrate:status'
alias rdc='bin/rails dbconsole'
alias rdR='bin/rails db:reset'
alias rgm='bin/rails g migration'
alias routes='bin/rails routes'

rdm() {
    if bin/rails -T | grep db:migrate:with_data -q; then
        bin/rails db:migrate:with_data
    else
        bin/rails db:migrate
    fi
}

alias raket='rake -T'
alias rakeall='raket -A'

# Quickly run something with Ruby.
r() {
    ruby -e "p $*"
}
