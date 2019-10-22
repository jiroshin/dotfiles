source ~/dotfiles/.oh-my-zshrc

# Settings for fzf
export PATH="$PATH:$HOME/.fzf/bin"
export FZF_DEFAULT_COMMAND='ag --hidden -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#mkdirとcdを同時にする
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

# alias
alias la='ls -a'
alias ll='ls -l'
alias gs='git status' # `git status`の確認
alias gd='git diff' # `git diff`の確認
alias gc='git commit' # commitする
alias gca='git commit --amend' #　前のコミットの編集
alias glo='git log --oneline' # コミットログを各一行で読む
alias vi='vim'
alias v='vim'
alias t='tmux'

# 移動系
alias dot='cd ~/dotfiles'
alias snaq='cd ~/Desktop/snaqme_workspace/snaqme-admin'
alias dev='cd ~/dev'
alias desktop='cd ~/Desktop'
alias m='cd ~/memo' 

#コマンド系
alias railss='bin/rails s -b 0.0.0.0 -p 3000'
alias dcu='docker-compose up'
