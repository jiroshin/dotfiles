export LANG=ja_JP.UTF-8

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

git_branch() {
  echo $(git branch --no-color 2>/dev/null | sed -ne "s/^\* \(.*\)$/\1/p")
}
PS1='\[\033[0;35m\]\t \[\033[0;34m\]\w \[\033[32m\]$(git_branch) \[\033[0m\]$ '
