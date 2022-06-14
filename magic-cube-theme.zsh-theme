#!/bin/bash
#
# This theme is a custom dark theme created with some functionalities like:
# * Location;
# * Git branch and status;
# * Date issues.
#
# # Fell free to enjoy this theme :)
# # This theme was inspired by 'fino-time' zsh theme



function time_icon {
   currDate=$(date +"%H%M")

   if [[ ${currDate} -gt 0600 && ${currDate} -lt 1745 ]]; then
       echo "%B☀%b"
   else
       echo "%B☾%b"
   fi 
}

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[239]%}⦅%{$reset_color%} %{$FG[200]%} %{$reset_color%}%{$fg[255]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$FG[239]%} ⦆%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[030]%}⇅"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%}✔"

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function prompt_char {
    echo '➤'
}

function box_name {
  local box="${SHORT_HOST:-$HOST}"
  [[ -f ~/.box-name ]] && box="$(< ~/.box-name)"
  echo "${box:gs/%/%%}"
}
RPROMPT=""
PROMPT="╭─%{$FG[040]%}%n%{$reset_color%} %{$FG[239]%}in%{$reset_color%} %{$terminfo[bold]$FG[202]%}%~%{$reset_color%}\$(git_prompt_info)          $(time_icon) %D | 🕘 %B%*%b
╰─\$(virtualenv_info)\$(prompt_char) "


