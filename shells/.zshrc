#--------------------------------------------------------------#
##        source oh-my-zsh                                    ##
#--------------------------------------------------------------#
# [ -d ~/.oh-my-zsh ] && source ~/dotfiles/shells/.oh-my-zshrc

#--------------------------------------------------------------#
##        source each PC settings                             ##
#--------------------------------------------------------------#
[ -f ~/dotfiles/secret/main.sh ] && source ~/dotfiles/secret/main.sh

#--------------------------------------------------------------#
##        set 256color                                        ##
#--------------------------------------------------------------#
TERM=xterm-256color

#--------------------------------------------------------------#
##        zsh Options                                         ##
#--------------------------------------------------------------#
# bindkey -v
# zsh補完
autoload -U compinit && compinit
# カラー設定
autoload -Uz colors && colors
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
##        set PROMPT                                          ##
#--------------------------------------------------------------#
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats '%b' '%c%u'
zstyle ':vcs_info:git:*' stagedstr "+"
zstyle ':vcs_info:git:*' unstagedstr "*"
PROMPT='%t %{$fg[cyan]%}%~%{$reset_color%} %{$fg[green]%}'\$vcs_info_msg_0_'%{$reset_color%}%{$fg[magenta]%}'\$vcs_info_msg_1_'%{$reset_color%} %{$fg[cyan]%}(^o^)/%{$reset_color%} '

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

function ghq_fzf_repo() {
  local remote_dir=$(ghq list | fzf)
  if [ -n "$remote_dir" ]; then
    BUFFER="cd ~/ghq/$remote_dir"
    zle accept-line
  fi
  zle -R -c
}
zle -N ghq_fzf_repo
bindkey '^]' ghq_fzf_repo

#--------------------------------------------------------------#
##        alias                                               ##
#--------------------------------------------------------------#
alias c='clear'
alias sl='ls'
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
alias ghop='gh repo view --web'
alias ringo='open -a Simulator'
# 移動系
alias dot='cd ~/dotfiles'
alias dev='cd ~/Dev'
alias lab='cd ~/Lab'
alias desktop='cd ~/Desktop'
#コマンド系
alias railss='bin/rails s -b 0.0.0.0 -p 3000'
alias dcu='docker-compose up'
