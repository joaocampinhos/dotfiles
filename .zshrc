export PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH
export EDITOR=nvim

autoload -U promptinit && promptinit
autoload -U compinit && compinit

prompt pure

alias ls='ls -G -a'
alias ..='cd ..'
# Switch to neovim
alias vim='nvim'
alias vimdiff='nvim -d'

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

source /Users/joaocampinhos/bin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
