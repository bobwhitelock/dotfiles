
# Will be linked in to be available as 'bob' oh-my-zsh theme.

# shellcheck disable=SC2034,SC1087,SC2154
ret_status="%(?:%{$fg_bold[green]%}$ :%{$fg_bold[red]%}$ )"
# shellcheck disable=SC2016

short_path() {
    shrink_path --last --nameddirs
}

# shellcheck disable=SC2016
PROMPT='%{$fg[cyan]%}[%T]%{$reset_color%} %{$fg[blue]%}$(short_path)%{$reset_color%} $(git_prompt_info)${ret_status}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=""
