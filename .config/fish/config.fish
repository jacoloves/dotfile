
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/anaconda3/bin/conda
    eval /opt/anaconda3/bin/conda "shell.fish" hook $argv | source
else
    if test -f "/opt/anaconda3/etc/fish/conf.d/conda.fish"
        . "/opt/anaconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH /opt/anaconda3/bin $PATH
    end
end
# <<< conda initialize <<<

set -x PATH /opt/homebrew/bin $PATH
set -x PATH $HOME/go/bin $PATH

# some more ls aliases
alias ls='lsd'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias goroot='cd $HOME/go/src/github.com/jacoloves'
alias py='python3'
alias g='git'
alias vim='nvim'
