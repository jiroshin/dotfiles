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
# [ -d ~/Desktop/old_settings ] && mkdir ~/Desktop/old_settings/
[ -f ~/.zshrc ] && mv ~/.zshrc ~/Desktop/old_settings/
[ -f ~/.zprofile ] && mv ~/.zprofile ~/Desktop/old_settings/
[ -f ~/.bashrc ] && mv ~/.bashrc ~/Desktop/old_settings/
[ -f ~/.bash_profile ] && mv ~/.bash_profile ~/Desktop/old_settings/
[ -f ~/.vimrc ] && mv ~/.vimrc ~/Desktop/old_settings/
[ -d ~/.vim ] && mv ~/.vim ~/Desktop/old_settings/

#--------------------------------------------------------------#
##        HomeBrew                                            ##
#--------------------------------------------------------------#
# echo 'start: Install HomeBrew'
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# brew update
# echo 'complete: Install Homebrew'

brew install tmux
brew install node
brew install zsh
brew install zsh-completion
brew install git
brew install git-lfs
brew install openssl
brew install ghq
brew install fzf
brew install tig
brew install fzf
brew install reattach-to-user-namespace
brew install github/gh/gh
brew install git-secret
brew install gnupg
brew install postgresql
brew install goenv
brew install ripgrep
brew install openapi-generator
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
brew install --cask alacritty
[ -d ~/.config/alacritty ] && rm ~/.config/alacritty/alacritty.yml

#--------------------------------------------------------------#
##        Git                                                 ##
#--------------------------------------------------------------#
git clone https://github.com/jiroshin/dotfiles.git ~/dotfiles
chmod 755 ~/dotfiles/tmux/tmuxbins/wifi
chmod 755 ~/dotfiles/tmux/tmuxbins/battery
touch ~/dotfiles/local/local.sh
echo "source ~/dotfiles/local/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/dotfiles/local/local.sh

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
ln -s ~/dotfiles/vim/.vimrc ~/.ideavimrc
echo 'complete: setup Symbolic Links'