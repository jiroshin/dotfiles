#!/bin/bash

set -e

cd ~
#--------------------------------------------------------------#
##        macOS settings                                      ##
#--------------------------------------------------------------#
defaults write com.apple.finder AppleShowAllFiles TRUE

#--------------------------------------------------------------#
##        clean old setting files                             ##
#--------------------------------------------------------------#
touch ~/Desktop/old_settings/
[ -f ~/.zshrc ] && mv ~/.zshrc ~/Desktop/old_settings/
[ -f ~/.zprofile ] && mv ~/.zprofile ~/Desktop/old_settings/
[ -f ~/.bashrc ] && mv ~/.bashrc ~/Desktop/old_settings/
[ -f ~/.bash_profile ] && mv ~/.bash_profile ~/Desktop/old_settings/
[ -f ~/.vimrc ] && mv ~/.vimrc ~/Desktop/old_settings/
[ -d ~/.vim ] && mv ~/.vim ~/Desktop/old_settings/

#--------------------------------------------------------------#
##        HomeBrew                                            ##
#--------------------------------------------------------------#
echo 'start: Install HomeBrew'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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

echo 'Installing fzf...'
brew install fzf

echo 'Installing others...'
brew install reattach-to-user-namespace
brew install github/gh/gh

# vimで使うアイコンのフォントたち
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font

echo 'Installing alacritty...'
brew cask install alacritty
[ -d ~/.config/alacritty ] && rm ~/.config/alacritty/alacritty.yml

#--------------------------------------------------------------#
##        Git                                                 ##
#--------------------------------------------------------------#
git clone https://github.com/jiroshin/dotfiles.git ~/dotfiles
chmod 755 ~/dotfiles/tmux/tmuxbins/wifi
chmod 755 ~/dotfiles/tmux/tmuxbins/battery

#--------------------------------------------------------------#
##        Symbolic Links                                      ##
#--------------------------------------------------------------#
echo 'start: setup Symbolic Links'
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/dotfiles/zsh/.zprofile ~/.zprofile
ln -s ~/dotfiles/bash/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/bash/.bashrc ~/.bashrc
ln -s ~/dotfiles/vim/.vim ~/.vim
ln -s ~/dotfiles/vim/dein ~/dein
ln -s ~/dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/dotfiles/tig/.tigrc ~/.tigrc
ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/alacritty/alacritty.yml ~/.alacritty.yml
echo 'complete: setup Symbolic Links'
