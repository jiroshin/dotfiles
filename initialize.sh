#!/bin/sh
echo 'HELLO! from  initialize.sh'
cd ~

#--------------------------------------------------------------#
##        OS settings                                         ##
#--------------------------------------------------------------#
echo 'start: setup os settings'
defaults write com.apple.finder AppleShowAllFiles TRUE
echo 'complete: setup os settings'

#--------------------------------------------------------------#
##        HomeBrew                                            ##
#--------------------------------------------------------------#
echo 'start: Install HomeBrew'
/usr/bin/ruby -e "$(/usr/bin/curl -fksSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"
brew update
brew doctor
echo 'complete: Install Homebrew'

echo 'Installing git...'
brew install git

echo 'Installing openssl...'
brew install openssl

echo 'Installing ghq...'
brew install ghq
git config --global ghq.root ~/src

#--------------------------------------------------------------#
##        Clean setting files                                 ##
#--------------------------------------------------------------#
echo 'start: Clean setting files'
rm ~/.zshrc
rm ~/.zprofile
rm ~/.bashrc
rm ~/.bash_profile
rm ~/.vimrc
rm -r ~/.vim
echo 'complete: Clean setting files'

#--------------------------------------------------------------#
##        git clone dotfiles                                  ##
#--------------------------------------------------------------#
echo 'start: git clone dotfiles'
git clone https://github.com/jiroshin/dotfiles.git ~/dotfiles
echo 'complete: git clone dotfiles'

#--------------------------------------------------------------#
##        set Symbolic Links                                  ##
#--------------------------------------------------------------#
echo 'start: setup Symbolic Links'
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.zprofile ~/.zprofile
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.vim ~/.vim 
ln -s ~/dotfiles/.dein ~/.dein
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.tigrc ~/.tigrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
source ~/.bash_profile
source ~/.zshrc
echo 'complete: setup Symbolic Links'
