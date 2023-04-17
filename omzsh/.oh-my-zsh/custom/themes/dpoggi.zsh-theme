PROMPT='%{$fg_bold[green]%}%n%{$fg[red]%}@%{$fg[cyan]%}%m\
%{$reset_color%}:%{$fg_bold[yellow]%}%~\
$(git_prompt_info) \
%{$fg[red]%}%(!.#.»)%{$reset_color%} '
RPS1='${return_code}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}("
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[magenta]%})%{$reset_color%}"
