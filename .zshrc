export EDITOR=nvim

autoload -U promptinit && promptinit
autoload -U compinit && compinit
autoload -U colors && colors

# PURE_PROMPT_SYMBOL=λ
PURE_PROMPT_SYMBOL="(つ••)つ"
prompt pure

alias ls='ls --color=auto'
alias la='ls --color=auto -a'
alias ..='cd ..'
alias c='clear'
alias vim='nvim'
alias vimdiff='nvim -d'

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

PATH=/home/joao/.gem/ruby/2.2.0/bin:$PATH

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
