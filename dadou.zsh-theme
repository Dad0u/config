# oh-my-zsh Bureau Theme

if [ $USER = "vic" ]
then
  _USERNAME="🦄"
else
  _USERNAME=$USER

fi

source /etc/os-release
if [[ $ID_LIKE == "arch" || $ID == "arch" ]]
then
  _HOSTCOLOR=$fg[blue]
else
  _HOSTCOLOR=$fg[green]
fi

if [ -n "$SSH_TTY" ]; then
  _PROMPT_SSH_NOTIFIER='⚡'
else
  _PROMPT_SSH_NOTIFIER=''
fi

#_PROMPT_TIME="[%{$fg[blue]%}%*%{$reset_color%}]"
_PROMPT_TIME="%{$fg[white]$bg[blue]%}%*%{$reset_color%}"

_PROMPT_CORE="$_USERNAME%{$fg_bold[magenta]%}@%{$_HOSTCOLOR%}%m%{$reset_color%}%2~"

if [ -z "$STY" ]
then
  _PROMPT_SCREEN=""
else
  _SCREEN_NAME="${STY#*.}" # Removing the number at the beggining
  _SCREEN_NAME="${_SCREEN_NAME%.*}" # Removing the host at the end (if present)
  _PROMPT_SCREEN="%{$bg[green]%}📺$_SCREEN_NAME%{$reset_color%}"
fi

_PROMPT_END="%{$fg_bold[yellow]%}>%{$reset_color%} "

PROMPT='$_PROMPT_SSH_NOTIFIER$_PROMPT_TIME$_PROMPT_CORE$_PROMPT_SCREEN$(git_super_status)$_PROMPT_END'
#RPROMPT=''
#RPROMPT='$(git_super_status)'
