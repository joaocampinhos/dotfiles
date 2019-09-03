export PATH=/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome:/usr/local/bin:/usr/local/sbin:~/bin:$PATH
export EDITOR=nvim

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

autoload -U promptinit; promptinit
autoload -Uz compinit; compinit

prompt pure

PURE_PROMPT_SYMBOL='ʕ•ᴥ•ʔ'
PURE_PROMPT_VICMD_SYMBOL='ʕ◡ᴥ◡ʔ'

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
alias vimstatus='vim -c "GFiles?"'
alias vstatus='vim `git status --porcelain | sed "s/^ M //g" | sed  "s/^?? //g" | grep -v "D "`'
alias ports='sudo lsof -i -n -P | grep TCP'
alias contents='ag --nobreak --nonumbers --noheading . | fzf'

export FZF_DEFAULT_COMMAND='rg --files'

alias lock='open -a ScreenSaverEngine'

eval $(thefuck --alias)

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

fpath=(/usr/local/share/zsh-completions $fpath)

kitty + complete setup zsh | source /dev/stdin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="/usr/local/opt/docker@1.11/bin:$PATH"


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export VOLTA_HOME="$HOME/.volta"
[ -s "$VOLTA_HOME/load.sh" ] && . "$VOLTA_HOME/load.sh"

export PATH="$VOLTA_HOME/bin:$PATH"
