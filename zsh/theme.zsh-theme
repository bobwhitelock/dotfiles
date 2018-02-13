
# Will be linked in to be available as 'bob' oh-my-zsh theme.

# shellcheck disable=SC2034
local ret_status="%(?:%{$fg_bold[green]%}$ :%{$fg_bold[red]%}$ )"
# shellcheck disable=SC2016

if [ -n "$SIMPLE_PROMPT" ]; then
    PROMPT='${ret_status}%{$reset_color%}'
else
    PROMPT='%{$fg[cyan]%}[%T]%{$reset_color%} %{$fg[blue]%}%~%{$reset_color%} $(git_prompt_info)${ret_status}%{$reset_color%}'
fi

# shellcheck disable=SC2034
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}"
# shellcheck disable=SC2034
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
# shellcheck disable=SC2034
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗"
# shellcheck disable=SC2034
ZSH_THEME_GIT_PROMPT_CLEAN=""
