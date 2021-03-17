
alias psql='psql -U postgres'

# Tail Postgres logs, with syntax-highlighting.
#
# Assumes Postgres has been configured to log every statement to a file in
# `/var/lib/postgres/data/pg_log` (see
# https://tableplus.com/blog/2018/10/how-to-show-queries-log-in-postgresql.html.)
pglog() {
    local pg_logs latest_log latest_log_path
    pg_logs='/var/lib/postgres/data/pg_log'

    latest_log="$(sudo ls -lrt "$pg_logs" | tail -n1 | awk '{ print $NF }')"
    latest_log_path="$pg_logs/$latest_log"

    echo "$latest_log_path"
    sudo tail -f "$latest_log_path" | bat --paging=never -l sql
}
