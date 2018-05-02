
export TODO_DIR="$NOTES/todo"

export TODO_FILE="$TODO_DIR/todo.txt"
export DONE_FILE="$TODO_DIR/done.txt"
export REPORT_FILE="$TODO_DIR/report.txt"


alias t='noglob todo.sh -tn -d "$ZSH_LIB/todotxt.sh"'
alias ta='t add'
alias tl='t list'
alias tdo='t do'
alias trm='t del'
