
function eh_create_history_database() {
        sqlite3 "$EH_DATABASE" <<- SQL
create table history (
        id integer primary key autoincrement not null,
        time timestamp default current_timestamp not null,
        command text not null,
        executed_command text not null,
        host text not null,
        dir text not null,
        user text not null,
        pid integer not null
    );
SQL

}

function eh_save_history() {
    if [ ! -f "$EH_DATABASE" ]; then
        eh_create_history_database
    fi
    sqlite3 "$EH_DATABASE" "insert into history (command, executed_command, host, dir, user, pid) values ('$1', '$3', '$HOST', '$PWD', '$USER', $$)";
}

[[ -z $preexec_functions ]] && preexec_functions=()
preexec_functions=($preexec_functions eh_save_history)
