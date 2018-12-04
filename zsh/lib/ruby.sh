
alias b='bundle'
alias be='bundle exec'
alias rspec='be rspec'

alias rc='bin/rails console'
alias rdm='bin/rails db:migrate'
alias rdr='bin/rails db:rollback'
alias rdms='bin/rails db:migrate:status'
alias rdc='bin/rails dbconsole'
alias rdR='bin/rails db:reset'
alias rgm='bin/rails g migration'
alias routes='rake routes'

alias rake='be rake'
alias raket='rake -T'
alias rakeall='raket -A'

# Quickly run something with Ruby.
r() {
    ruby -e "p $*"
}
