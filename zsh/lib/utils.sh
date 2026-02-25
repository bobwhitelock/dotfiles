
# Misc aliases.
alias cat='bat'
alias df='df --human-readable'
alias diff='diff --color=always'
alias m='make'
alias t='task'
alias open='xdg-open'
alias pyserver="python -m http.server"
alias rerun="rerun --pattern '**/*' --no-notify"
alias sa="source_libs"
alias spark='sparklines'
alias split_words="sed 's/\s/\n/g'"
alias sz='source ~/.zshrc'
alias urldecode='ruby -r cgi -e "puts CGI.unescape(ARGV[0])"'
alias urlencode='ruby -r cgi -e "puts CGI.escape(ARGV[0])"'
alias tf='terraform'
alias tfa='terraform init && terraform apply'
alias tf_yolo='tf destroy -auto-approve && tf apply -auto-approve; pingme "$?"'
alias pw='npx prettier -w'
alias clear="clear -x"

# On Fedora, `vimx` from `vim-X11` is the fully featured Vim with `+clipboard`
# support; alias `vim` to this if it's installed.
(( $+commands[vimx] )) && alias vim='vimx'

# From https://unix.stackexchange.com/a/102021/229081.
alias trim="sed 's/^[[:blank:]]*//;s/[[:blank:]]*$//'"

# Make copy/paste-ing in commands from examples slightly more seamless.
alias '$'=''

# Switch to minimal prompt, most useful for copying terminal output to share
# elsewhere. Run `sz` to revert to normal prompt.
alias simple_prompt='PS1="$ "'

# Copy/paste to/from system clipboard (xclip default is primary clipboard, i.e.
# middle-click clipboard).
alias cbcopy='xclip -selection clipboard'
alias cbpaste='xclip -selection clipboard -out'

# Copy full path to file/current directory to system clipboard.
cppath() {
    readlink -f "$@" | cbcopy
}
alias cpdir='pwd | cbcopy'

# Quickly switch between UK and US keyboard layouts.
alias ukk='setxkbmap gb'
alias usk='setxkbmap us'

du() {
    command du -h "$@" | sort -h
}

# "ripgrep pretty", i.e. with output always coloured and piped to `bat`.
rgp() {
    rg --pretty "$@" | bat
}

# Swap 2 filenames around, if they exist (from
# http://tldp.org/LDP/abs/html/sample-bashrc.html).
swap() {
    local TMPFILE=tmp.$$

    [ $# -ne 2 ] && echo "swap: 2 arguments needed" && return 1
    [ ! -e "$1" ] && echo "swap: $1 does not exist" && return 1
    [ ! -e "$2" ] && echo "swap: $2 does not exist" && return 1

    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

absolute_path() {
    readlink --canonicalize --no-newline "$@"
}
alias path='absolute_path'

# Echo to stderr.
echoerr() {
    echo "$@" >&2
}


# Usage: `inplace some update file`, to apply `some update` to `file` and write
# the output back to the same file.
inplace() {
    local file="${@: -1}"
    local tmp=$(mktemp)
    "$@" > "$tmp" && mv "$tmp" "$file"
}

# Compress and tar a directory.
# XXX Make this better:
# - check dir exists and use dir first
# - abort if no arg given
tar_dir() {
    tar -zcvf "$1".tar.gz "$1"
}

# Show output of `ps` for all processes matching `pgrep`.
pshow() {
    pgrep "$@" | xargs --no-run-if-empty ps -l
}

# XXX BW 2025-09-22: Maybe make output more consistent in each case
# XXX BW 2025-09-22: Refactor/test this to make it more understandable
# XXX BW 2025-09-22: Could use `bat --file-name` to show the alias details
# instead of `STDIN`?
# XXX BW 2025-09-22: Could this go to a separate script? However it needs
# access to shell environment for various finding commands to find the right
# things.
def() {
    local name="$1"

    # Handle `def git alias-name` case
    if [[ "$name" == "git" && $# -gt 1 ]]; then
        local git_alias="$2"
        if alias_def=$(git config --get "alias.$git_alias" 2>/dev/null); then
            # If alias is just a single command name, recursively show the git-command script
            # Example: $ def git cloc
            #   git-cloc is /home/bob/bin/git-cloc
            #   /home/bob/bin/git-cloc: symbolic link to /home/bob/src/github.com/bobwhitelock/dotfiles/bin/git-cloc
            #   #!/usr/bin/env bash
            #   [... script content with syntax highlighting ...]
            if [[ "$alias_def" =~ ^[a-zA-Z0-9_-]+$ ]]; then
                def "git-$alias_def"
            # Complex git alias with multiple commands or arguments
            # Example: $ def git amend
            #   commit --verbose --amend -C HEAD
            else
                echo "$alias_def"
            fi
            return
        # Built-in git command
        # Example: $ def git branch
        #   branch is a git command
        elif git help -a | grep -q "^   $git_alias "; then
            echo "$git_alias is a git command"
        # Not found as either alias or command
        else
            echo "No git alias or command found: $git_alias"
        fi
    else
        local type_output=$(type "$name" 2>/dev/null)
        echo "$type_output"

        # Shell function
        # Example: $ def echoerr
        #   echoerr is a shell function from zsh/lib/utils.sh
        #   echoerr () {
        #   	echo "$@" >&2
        #   }
        if [[ "$type_output" =~ "is a shell function" ]]; then
            which "$name" 2>/dev/null | command bat --language bash || true
        # Shell alias case is handled by type output alone
        # Example: $ def cbcopy
        #   cbcopy is an alias for xclip -selection clipboard
        # Skip additional processing for aliases since type already shows the definition
        elif [[ ! "$type_output" =~ "is an alias" ]]; then
            local path=$(which "$name" 2>/dev/null)
            if [[ -n "$path" && -f "$path" ]]; then
                local file_type=$(command file "$path" 2>/dev/null)
                # Script or text file - show content with syntax highlighting
                if [[ "$file_type" =~ "script" || "$file_type" =~ "text" ]]; then
                    command bat --color always "$path" | command less -R
                # Symbolic link - show link info then target content
                # Example: $ def gs
                #   gs is /home/bob/bin/gs
                #   /home/bob/bin/gs: symbolic link to /home/bob/src/github.com/bobwhitelock/dotfiles/bin/gs
                #   #!/usr/bin/env bash
                #   [... script content with syntax highlighting ...]
                elif [[ "$file_type" =~ "symbolic link" ]]; then
                    echo "$file_type"
                    local target=$(command readlink -f "$path")
                    if [[ -f "$target" ]]; then
                        local target_type=$(command file "$target" 2>/dev/null)
                        # Target is a script - show its content
                        # Example: $ def gs
                        #   gs is /home/bob/bin/gs
                        #   /home/bob/bin/gs: symbolic link to /home/bob/src/github.com/bobwhitelock/dotfiles/bin/gs
                        #   #!/usr/bin/env bash
                        #   [... script content with syntax highlighting ...]
                        # XXX BW 2025-09-22: This is the same as above - refactor
                        if [[ "$target_type" =~ "script" || "$target_type" =~ "text" ]]; then
                            command bat --color always "$target" | command less -R
                        # Target is a binary - show file type info
                        # Example: $ def python3
                        #   python3 is /usr/bin/python3
                        #   /usr/bin/python3: symbolic link to python3.12
                        #   /usr/bin/python3.12: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked
                        # XXX BW 2025-09-22: This is the same as below - refactor
                        else
                            echo "$target_type"
                        fi
                    fi
                else
                    # binary executable - show file type and architecture info
                    # Example: $ def bash
                    #   bash is /usr/bin/bash
                    #   /usr/bin/bash: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=2f77b36371c214e11670c7d9d92727e9a49f626b, for GNU/Linux 3.2.0, stripped
                    echo "$file_type"
                fi
            fi
        fi
    fi
}
