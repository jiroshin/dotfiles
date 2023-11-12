#--------------------------------------------------------------#
##        env                                                 ##
#--------------------------------------------------------------#
export LC_ALL=ja_JP.UTF-8
export HISTSIZE=50000
export SAVEHIST=50000
export PATH=$HOME/.anyenv/bin:$PATH
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export GOENV_DISABLE_GOPATH=1
export SDL_ROOT=$HOME/Dev
export PATH=$HOME/ghq/github.com/jiroshin/starting-directory-list:$PATH
export GPG_TTY=$(tty)

#--------------------------------------------------------------#
##        fzf settings                                        ##
#--------------------------------------------------------------#
# Get the aliases and functions
if [ -f ~/.zshrc ]; then
	. ~/.zshrc
fi

#--------------------------------------------------------------#
##        others                                              ##
#--------------------------------------------------------------#
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(direnv hook zsh)"
eval "$(anyenv init -)"
