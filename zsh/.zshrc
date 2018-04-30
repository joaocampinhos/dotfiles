export PATH=/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome:/usr/local/bin:/usr/local/sbin:~/bin:$PATH
export PHABRICATOR_TOOLS_PATH=~/bin/phabricator-tools
export DEVELOPMENT_TOOLS_PATH=~/bin/phabricator-tools
export PATH=$PHABRICATOR_TOOLS_PATH/phabricator/arcanist/bin/:$PATH
export EDITOR=nvim

autoload -U promptinit; promptinit

prompt pure

PURE_PROMPT_SYMBOL='ʕ•ᴥ•ʔ'

alias ls='ls -G'
alias la='ls -a'
alias ..='cd ..'
alias c='clear'
alias vim='nvim'
alias pwdc='pwd | pbcopy'
alias vimdiff='nvim -d'
alias cm='cd ~/feedzai/case-manager'
alias ui='cd ~/feedzai/ui'
alias cmf='cd /Users/joao.campinhos/feedzai/case-manager/alert-manager-web/src/main/webapp'
alias server='python -m SimpleHTTPServer 1337'
alias vimstatus='vim `git diff --name-only`'
alias vstatus='vim `git status --porcelain | sed "s/^ M //g" | sed  "s/^?? //g" | grep -v "D "`'
alias ports='sudo lsof -i -n -P | grep TCP'
alias contents='ag --nobreak --nonumbers --noheading . | fzf'

alias lock='open -a ScreenSaverEngine'

eval $(thefuck --alias)

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

fpath=(/usr/local/share/zsh-completions $fpath)


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="/usr/local/opt/docker@1.11/bin:$PATH"
