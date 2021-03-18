#--------------------------------------------------------------#
##        source local zsh settings                           ##
#--------------------------------------------------------------#
[ -f ~/dotfiles/local/local.sh ] && source ~/dotfiles/local/local.sh

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
source /usr/local/etc/zsh-kubectl-prompt/kubectl.zsh
# PROMPT='%t %{$fg[cyan]%}%~%{$reset_color%} %{$bg[green]%}%{$fg[black]%}['\$vcs_info_msg_0_']%{$fg[magenta]%}'\$vcs_info_msg_1_'%{$reset_color%} %{$bg[cyan]%}%{$fg[black]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%} %{$fg[green]%}(^-^)/%{$reset_color%} '
PROMPT='%t %F{cyan}%~%f %K{green}%F{black}['\$vcs_info_msg_0_']%F{magenta}'\$vcs_info_msg_1_'%f%K %K{cyan}%F{black}($ZSH_KUBECTL_PROMPT)%f%K %F{green}(^-^)/%f '

#--------------------------------------------------------------#
##        fzf settings                                        ##
#--------------------------------------------------------------#
export PATH="$PATH:$HOME/.fzf/bin"
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#--------------------------------------------------------------#
##        functions                                           ##
#--------------------------------------------------------------#
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

function cd_ghq_and_sdl() {
  local destination_dir=$(echo "$(ghq list --full-path) $(sdl)" | fzf)
  if [ -n "$destination_dir" ]; then
    BUFFER="cd $destination_dir"
    zle accept-line
  fi
  zle clear-screen
}
zle -N cd_ghq_and_sdl
bindkey '^]' cd_ghq_and_sdl

function search_cmd_history() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(\history -n -r 1 | eval $tac | fzf --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N search_cmd_history
bindkey '^h' search_cmd_history

function search_git_checkout_branch() {
  local selected_branch=$(git for-each-ref --format='%(refname)' --sort=-committerdate refs/heads | perl -pne 's{^refs/heads/}{}' | fzf --query "$LBUFFER")
  if [ -n "$selected_branch" ]; then
    BUFFER="git checkout ${selected_branch}"
    CURSOR=$#BUFFER
  fi
  zle clear-screen
}
zle -N search_git_checkout_branch
bindkey "^b" search_git_checkout_branch

#--------------------------------------------------------------#
##        kubectl                                             ##
#--------------------------------------------------------------#
source <(kubectl completion zsh)

#--------------------------------------------------------------#
##        alias                                               ##
#--------------------------------------------------------------#
alias c='clear'
alias sl='ls'
alias la='ls -a'
alias ll='ls -l'
alias gco='git checkout'
alias gp='git pull'
alias gf='git fetch'
alias vi='vim'
alias v='vim'
alias v.='vim .'
alias t='tmux -u'
alias brcopy='git symbolic-ref --short HEAD | pbcopy'
alias ghop='gh repo view --web'
alias ringo='open -a Simulator'
# 移動系
alias dot='cd ~/dotfiles'
alias lab='cd ~/Lab'
alias desktop='cd ~/Desktop'
# コマンド系
alias railss='bin/rails s -b 0.0.0.0 -p 3000'
alias dcu='docker-compose up'
