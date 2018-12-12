##CUDA
export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64

export PATH=${CUDA_HOME}/bin:${PATH}

# Git prompt
source ~/projects/zsh-git-prompt/zshrc.sh

# thefuck
eval "$(thefuck --alias fuck)"
alias f=fuck

#PROMPT='%B%m%~%b$(git_super_status) %# '
#PROMPT="%{[36;1m%}%T %{[31m%}%n%{[33m%}@%{[37m%}%m %{[32m%}%~ %{[33m%}%#%{[0m%} "
#PROMPT='%{[36;1m%}%T %{[31m%}%n%{[33m%}@%{[37m%}%m %{[32m%}%~%{[0m%} $(git_super_status)%{[33;1m%}%#%{[0m%} '

if [ $USER = "vic" ]
then
  PROMPT='%{[36;1m%}%T 🦄@%{[37m%}%m %{[32m%}%~%{[0m%} $(git_super_status)%{[33;1m%}%#%{[0m%} '
else
  PROMPT='%{[36;1m%}%T %{[31m%}%n%{[33m%}@%{[37m%}%m %{[32m%}%~%{[0m%} $(git_super_status)%{[33;1m%}%#%{[0m%} '
fi

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
alias ipy="python /usr/local/bin/ipython --profile=crappy"
alias ipy3="python3 /usr/local/bin/ipython --profile=crappy"

#alias ap='sudo apt -o Acquire::http::Proxy="http://cache.ec-lille.fr:3128"'
alias ap='sudo apt'
alias apud='ap update'
alias apug='ap upgrade'
alias apudg='apud && apug'
alias api='ap install'
alias ":q"="exit"

alias py='python'
alias py3='python3'

export http_proxy="http://cache.centralelille.fr:3128"
export https_proxy="https://cache.centralelille.fr:3128"

source ~/projects/zsh-background-notify/bgnotify.plugin.zsh

# virtualenv and virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source /usr/local/bin/virtualenvwrapper.sh

#export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python3.6/site-packages



# added by Anaconda3 5.3.0 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
#
#__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/vic/projects/anaconda/bin/conda' shell.bash hook 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    \eval "$__conda_setup"
#else
#    if [ -f "/home/vic/projects/anaconda/etc/profile.d/conda.sh" ]; then
#        . "/home/vic/projects/anaconda/etc/profile.d/conda.sh"
#        CONDA_CHANGEPS1=false conda activate base
#    else
#        \export PATH="$PATH:/home/vic/projects/anaconda/bin"
#    fi
#fi
#unset __conda_setup

# <<< conda init <<<

init_conda () {
__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/vic/projects/anaconda/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/home/vic/projects/anaconda/etc/profile.d/conda.sh" ]; then
        . "/home/vic/projects/anaconda/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="$PATH:/home/vic/projects/anaconda/bin"
    fi
fi
unset __conda_setup
}

alias spyder='init_conda && spyder'
