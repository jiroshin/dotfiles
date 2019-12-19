#!/bin/sh
echo 'HELLO! from initialize.sh'
cd ~

#--------------------------------------------------------------#
##        OS settings                                         ##
#--------------------------------------------------------------#
echo 'start: setup os settings'
defaults write com.apple.finder AppleShowAllFiles TRUE
echo 'complete: setup os settings'

#--------------------------------------------------------------#
##        Clean setting files                                 ##
#--------------------------------------------------------------#
echo 'start: Clean setting files'
[ -f ~/.zshrc ] && rm ~/.zshrc
[ -f ~/.zprofile ] && rm ~/.zprofile
[ -f ~/.bashrc ] && rm ~/.bashrc
[ -f ~/.bash_profile ] && rm ~/.bash_profile
[ -f ~/.vimrc ] && rm ~/.vimrc
[ -d ~/.vim ] && rm -r ~/.vim
echo 'complete: Clean setting files'

#--------------------------------------------------------------#
##        HomeBrew install                                    ##
#--------------------------------------------------------------#
echo 'start: Install HomeBrew'
/usr/bin/ruby -e "$(/usr/bin/curl -fksSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"
brew update
brew doctor
echo 'complete: Install Homebrew'

echo 'Installing zsh...'
brew install zsh
brew install zsh-completion

echo 'Installing git...'
brew install git

echo 'Installing openssl...'
brew install openssl

echo 'Installing ghq...'
brew install ghq
git config --global ghq.root ~/src

echo 'Installing fzf...'
brew install fzf

echo 'Installing alacritty...'
brew cask install alacritty
[ -d ~/.config/alacritty ] && rm ~/.config/alacritty/alacritty.yml

#--------------------------------------------------------------#
##       others install                                       ##
#--------------------------------------------------------------
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

#--------------------------------------------------------------#
##        git clone dotfiles                                  ##
#--------------------------------------------------------------#
echo 'start: git clone dotfiles'
git clone https://github.com/jiroshin/dotfiles.git ~/dotfiles
echo 'complete: git clone dotfiles'

#--------------------------------------------------------------#
##        change shell and start                              ##
#--------------------------------------------------------------#
sudo sh -c '/usr/local/bin/zsh >> /etc/shells'
chsh -s /usr/local/bin/zsh
zsh

#--------------------------------------------------------------#
##        set Symbolic Links                                  ##
#--------------------------------------------------------------#
echo 'start: setup Symbolic Links'
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.zprofile ~/.zprofile
rm ~/.zshrc && ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.vim ~/.vim 
ln -s ~/dotfiles/.dein ~/.dein
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.tigrc ~/.tigrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
source ~/.zshrc
echo 'complete: setup Symbolic Links'
