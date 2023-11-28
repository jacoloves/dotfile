# PATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export XDG_BASE_HOME='~/.config'
export VIMPLUGIN='~/.vim/pack/plugins/start'
export XDG_CACHE_HOME='~/.cache'
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
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias dice='$HOME/tmp/lab/go_tool/dice_korokoro/dice'
alias ide='$HOME/tmp/dotfile/.scripts/ide_setting.sh'
alias clion='sh $HOME/Documents/clion-2022.3/bin/clion.sh'
alias abcp='$HOME/tmp/release/2023/atcoder_template_copy/abcp.sh'
alias goroot='cd $HOME/go/src/github.com/jacoloves'

# Fill in the candidates
zstyle ':completion:*' menu select

# correct keyword
setopt correct

# Setting Prompt
PROMPT='%F{cyan}%/%f %F{yellow}%D%f %F{magenta}%*%f
%F{green} (つ・ω・)つ%f'
RPROMPT='[%F{green}%n%f]'

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
