#--------------------------------------------------------------#
##        source oh-my-zsh                                    ##
#--------------------------------------------------------------#
source ~/dotfiles/.oh-my-zshrc

#--------------------------------------------------------------#
##        set 256color                                        ##
#--------------------------------------------------------------#
export TERM=xterm-256color

#--------------------------------------------------------------#
##        source each PC settings                             ##
#--------------------------------------------------------------#
source ~/dotfiles/only-for-this-machine/main.sh

#--------------------------------------------------------------#
##        zsh Options                                         ##
#--------------------------------------------------------------#
# zsh補完
autoload -U compinit
compinit
autoload -U colors
colors
#単語の入力途中でもTab補完を有効化
setopt complete_in_word
# 補完候補をハイライト
zstyle ':completion:*:default' menu select=1
# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true
#大文字、小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完リストの表示間隔を狭くする
setopt list_packed
# cdなしでディレクトリを移動
setopt auto_cd
# cdでディレクトリの移動履歴表示
setopt auto_pushd
# コマンドのうち間違え防止
setopt correct

#--------------------------------------------------------------#
##        fzf settings                                        ##
#--------------------------------------------------------------#
export PATH="$PATH:$HOME/.fzf/bin"
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 30% --border'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#--------------------------------------------------------------#
##        functions                                           ##
#--------------------------------------------------------------#
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

#--------------------------------------------------------------#
##        alias                                               ##
#--------------------------------------------------------------#
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
alias brcopy='git symbolic-ref --short HEAD | pbcopy'
# 移動系
alias dot='cd ~/dotfiles'
alias dev='cd ~/Dev'
alias lab='cd ~/Lab'
alias desktop='cd ~/Desktop'
alias ghfzf='cd `ghq list --full-path | fzf`'
#コマンド系
alias railss='bin/rails s -b 0.0.0.0 -p 3000'
alias dcu='docker-compose up'
