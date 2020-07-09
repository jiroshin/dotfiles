[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#mkdirとcdを同時にする
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

# alias
alias vi='vim'
alias v='vim'
alias t='tmux'

# 移動系
alias dot='cd ~/dotfiles'
