#if [ -z "$STY" ] then
#  screen -q
#fi

# Git prompt
source ~/projects/zsh-git-prompt/zshrc.sh
export LANG=fr_FR.UTF-8

# thefuck
eval "$(thefuck --alias fuck)"
alias f=fuck

#PROMPT='%B%m%~%b$(git_super_status) %# '
#PROMPT="%{[36;1m%}%T %{[31m%}%n%{[33m%}@%{[37m%}%m %{[32m%}%~ %{[33m%}%#%{[0m%} "
#PROMPT='%{[36;1m%}%T %{[31m%}%n%{[33m%}@%{[37m%}%m %{[32m%}%~%{[0m%} $(git_super_status)%{[33;1m%}%#%{[0m%} '

if [ $USER = "vic" ]
then
  _USERNAME=🦄
else
  _USERNAME="%n"
fi

issue=`cat /etc/issue`

if [[ $issue == *Manjaro* || $issue == *Arch* ]];
then
  _ATCOL=[35m%
else
  _ATCOL=[34m%
fi

#PROMPT="%{[36;1m%}%T %{[31m%}$_USERNAME%{[33m%}@%{[37m%}%m %{[32m%}%~%{[0m%} $(git_super_status)%{[33;1m%}%#%{[0m%} "
PROMPT="%{[36;1m%}%T %{[31m%}$_USERNAME%{$_ATCOL}@%{[37m%}%m %{[32m%}%~%{[0m%} $(git_super_status)%{[33;1m%}%#%{[0m%} "
# To allow overwriting with redirections
setopt clobber

# Commands starting with a space will not be saved in history
setopt histignorespace

# For autocompletion from history with arrows
HISTSIZE=500
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

#alias ipy="ipython3 --profile=crappy"
#alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
alias ipy="python /usr/bin/ipython"
alias ipy3="python3 /usr/bin/ipython"

alias ":q"="exit"

alias ls='ls -h --color'
alias ll='ls -l'
alias lla='ls -la'
alias la='ls -a'

alias LS='sl'
alias l='sl'

alias du='du -h'
alias df='df -h'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias py='python'
alias py3='python3'

alias c='clear'

# Correspondance touches-fonction
bindkey ''    beginning-of-line       # Home
bindkey "\e[1~" beginning-of-line
bindkey "\e[H"  beginning-of-line
bindkey ''    end-of-line             # End
bindkey "\e[4~" end-of-line
bindkey "\e[F"  end-of-line
bindkey ''    delete-char             # Del
bindkey '[3~' delete-char
bindkey '[2~' overwrite-mode          # Insert
bindkey '[5~' history-search-backward # PgUp
bindkey '[6~' history-search-forward  # PgDn
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Prise en charge des touches [début], [fin] et autres
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char


# Quand l'utilisateur commence sa commande par '!' pour faire de la
# complétion historique, il n'exécute pas la commande immédiatement
# mais il écrit la commande dans le prompt
setopt hist_verify

# Nombre d'entrées dans l'historique
export HISTORY=1000
export SAVEHIST=1000

# Fichier où est stocké l'historique
export HISTFILE=$HOME/.history

# Autocomplétion

zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}'
zstyle ':completion:*' max-errors 3 numeric
zstyle ':completion:*' use-compctl false

autoload -U compinit
compinit
