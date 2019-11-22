export LANG=ja_JP.UTF-8

# SHELL LOGIN WITH TMUX / If not running interactively, do not do anything
# [[ $- != *i* ]] && return
# [[ -z "$TMUX" ]] && exec tmux

# Get the aliases and functions
if [ -f ~/.zshrc ]; then
	. ~/.zshrc
fi

eval "$(rbenv init -)"
eval "$(pyenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.nodebrew/current/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PKG_CONFIG_PATH=/usr/local/Cellar/imagemagick@6/6.9.10-27/lib/pkgconfig
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go

# Pythonバージョン管理のパス
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Lambda
export PATH=~/.local/bin:$PATH
