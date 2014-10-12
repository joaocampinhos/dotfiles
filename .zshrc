export PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH
autoload -U promptinit && promptinit
autoload -U compinit && compinit
prompt pure
alias ls='ls -G -a'
alias ..='cd ..'

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

source /Users/joaocampinhos/bin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
