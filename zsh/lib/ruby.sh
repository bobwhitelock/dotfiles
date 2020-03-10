
alias b='bundle'
alias be='bundle exec'
alias rspec='be rspec'

alias rc='bin/rails console'
# XXX Make this do `db:migrate` or `db:migrate:with_data` depending on whether
# the latter is valid - i.e. either attempt the latter and fallback to former,
# or check for presence of `data_migrate` Gem to decide.
alias rdm='bin/rails db:migrate:with_data'
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
