#if [ -z "$STY" ] ; then
#  screen -q
#fi

# Git prompt
source ~/projects/zsh-git-prompt/zshrc.sh

export LANG=fr_FR.UTF-8
export PATH="$HOME/bin":$PATH

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
PROMPT='%{[36;1m%}%T %{[31m%}$_USERNAME%{$_ATCOL}@%{[37m%}%m %{[32m%}%~%{[0m%} $(git_super_status)%{[33;1m%}%#%{[0m%} '
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

alias ipy="ipython"
alias ipy3="ipython3"

alias ":q"="exit"

alias ls='ls -h --color'
alias ll='ls -l'
alias lla='ls -la'
alias la='ls -a'

alias LS='sl'
alias l='sl'

alias du='du -h'
alias df='df -h'
#alias cp='cp -i'
#alias mv='mv -i'
#alias rm='rm -i'

alias py='python'
alias py3='python3'

alias c='clear'

alias dfc='dfc -p -/dev/loop,tmpfs,udev'

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

command_not_found_handler () {
    local INSULTS=(
        "Boooo !"
        "Don't you know anything ?"
        "I will leave you a minute to let you think about what you just did"
        "RTFM !"
        "Hahaha, n00b !"
        "Wow! That was impressively wrong !"
        "What are you doing ??"
        "Pathetic"
        "The worst one today !"
        "n00b alert !"
        "lol"
        "You failed me 💔"
        ":("
        "I hope no one is seeing this..."
        "It is so embarrassing"
        "Wow, you suck !"
        "lol... plz"
        "plz uninstall"
        "And the Darwin Award goes to.... ${USER} !"
        "ERROR_INCOMPETENT_USER"
        "Incompetence is also competence"
        "Bad."
        "Fake it till you make it!"
        "What is this ? Amateur hour !?"
        "Come on! You can do it !"
        "Nice try."
        "What if... you type an actual command the next time !"
        "What if I told you... it is possible to type valid commands."
        "Y u no speak computer ???"
        "This is not Windows"
        "Perhaps you should leave the command line alone..."
        "Please step away from the keyboard !"
        "error code: 1D10T"
        "Pro tip: type a valid command !"
        "Go outside."
        "Go sit by a lake"
        "Wait... What ?"
        "At least you tried"
        "Why me ? 😢"
        "🤔"
        "U tried 😕"
        "Dude, WTF ?"
        "Are you sure you are qualified to use computers ?"
        "Take a deep breath and try again"
        "Maybe you should lie down for a few minutes"
        "You should press the buttons in the correct order"
        "This is not a search engine."
        "So, I'm just going to go ahead and run rm -rf / for you."
        "Why are you so stupid?!"
        "Perhaps computers are not for you..."
        "Why are you doing this to me ?!"
        "Don't you have anything better to do ?!"
        "I am _seriously_ considering 'rm -rf /'-ing myself..."
        "This is why nobody likes you."
        "Are you even trying ?!"
    )

    /usr/lib/command-not-found --no-failure-msg -- ${1+"$1"}
    printf "$(tput bold)$(tput setaf 1)$(shuf -n 1 -e "${INSULTS[@]}")$(tput sgr0)"
    echo ""
    # Return the exit code normally returned on invalid command
    return 127
}

source /etc/zsh_command_not_found
