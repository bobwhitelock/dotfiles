
export TODO_DIR="$NOTES/todo"

export TODO_FILE="$TODO_DIR/next_actions.todo"
export DONE_FILE="$TODO_DIR/done.todo"
export REPORT_FILE="$TODO_DIR/report.todo"


alias t='noglob todo.sh -tn -d "$ZSH_LIB/todotxt.sh"'
alias ta='t add'
alias tl='t list'
alias tdo='t do'
alias trm='t del'
alias tprojects='t listproj'
alias tcontexts='t listcon'
alias inbox='t addto inbox.todo'
