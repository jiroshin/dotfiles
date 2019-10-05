# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

PS1='\[\033[0;35m\]\t \[\033[0;34m\]\w \[\033[32m\]$(git_branch) \[\033[0m\]$ '

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

export ANDROID_SDK="$HOME/Library/Android/sdk"
export PATH="$ANDROID_SDK/emulator:$PATH"
export PATH="$ANDROID_SDK/platform-tools:$PATH"
