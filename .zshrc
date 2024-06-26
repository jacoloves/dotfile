# PATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export XDG_BASE_HOME='~/.config'
export VIMPLUGIN='~/.vim/pack/plugins/start'
. "$HOME/.cargo/env"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt autocd extendedglob nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/stanaka/.zshrc'

autoload -Uz compinit
compinit

# zsh theme
ZSH_THEME="candy"

# cd <tab> history directory
setopt auto_pushd

# can watch japanese file name
setopt print_eight_bit

# charcter chord set
export LANG=ja_JP.UTF-8

# use color
autoload -Uz colors
colors

# some more ls aliases
alias ls='lsd'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias dice='$HOME/tmp/lab/go_tool/dice_korokoro/dice'
alias ide='$HOME/tmp/dotfile/.scripts/ide_setting.sh'
alias clion='sh $HOME/Documents/clion-2022.3/bin/clion.sh'
alias abcp='$HOME/tmp/release/2023/atcoder_template_copy/abcp.sh'
alias goroot='cd $HOME/go/src/github.com/jacoloves'
alias chro="open -a 'Google Chrome'"
alias E="emacsclient -nw"
alias kill-emacs="emacsclient -e '(kill-emacs)'"
alias labroot="$HOME/tmp/new_lab/2024/"
alias cpt='cp -p ./tmp.cpp ./$1.cpp'
alias py='python3'
alias g='git'

# Fill in the candidates
zstyle ':completion:*' menu select

# correct keyword
setopt correct

# git setting
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# Setting Prompt
PROMPT='%F{cyan}%/%f %F{yellow}%D%f %F{magenta}%*%f
%F{green} (つ・ω・)つ%f'
RPROMPT='[%F{green}${vcs_info_msg_0_}%f]'
zstyle ':vcs_info:git:*' formats '%b'

# auto cd
setopt auto_cd

# zplug start
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
fi

source ~/.zplug/init.zsh

## Write here the tools you want to use.
## zplug "username/repository name", tags

## end

zplug "zplug/zplug", hook-build:'zplug --self-mage'

if ! zplug check --verbose; then
    printf "Install! [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load --verbose

# zplug end

# zle process
function _git_clean_fdx() {
    echo git clean -fdx
    echo "\n" 
    git clean -fdx
    zle reset-prompt 
}
zle -N git_clean_fdx _git_clean_fdx 
bindkey "^g^f" git_clean_fdx 

export PULSE_SERVER=tcp:127.0.0.1

setopt nonomatch

# End of lines added by compinstall

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f "/Users/stanaka/.ghcup/env" ] && source "/Users/stanaka/.ghcup/env" # ghcup-env

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

