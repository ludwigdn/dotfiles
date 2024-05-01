# settings
typeset +H return_code="%(?..%{$fg[red]%}%{$reset_color%})"
typeset +H my_gray="$FG[237]"
typeset +H my_orange="$FG[210]"
typeset +H my_green="$FG[070]"
typeset +H my_blue="$FG[075]"

# primary prompt
PS1='
%{$fg[white]%}[%D{%H:%M:%S}] $my_gray%n%{$reset_color%} $FG[033]%~$(git_prompt_info)$(hg_prompt_info) $FG[105]%(!.#.:)%{$reset_color%} '
PS2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$my_blue ($my_green"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange *%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$my_blue)%{$reset_color%}"

# hg settings
ZSH_THEME_HG_PROMPT_PREFIX="$my_blue ($my_green"
ZSH_THEME_HG_PROMPT_CLEAN=""
ZSH_THEME_HG_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_HG_PROMPT_SUFFIX="$my_blue)%{$reset_color%}"

# virtualenv settings
ZSH_THEME_VIRTUALENV_PREFIX=" $my_blue ["
ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%}"
