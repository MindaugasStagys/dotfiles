#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

# Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Oh-my-zsh and plugins
curl -O https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
bash install.sh
rm install.sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install htop
brew install tree
brew install tmux
brew install ack
brew install --cask kitty

brew install koekeishiya/formulae/yabai
sudo yabai --install-sa
sudo yabai --load-sa

brew install --cask miniconda

brew install ruby
gem install colorls

# Configuration files
scp .zshrc ~/.zshrc
scp .vimrc ~/.vimrc
scp .p10k.zsh ~/.p10k.zsh
scp kitty.conf ~/.config/kitty/kitty.conf
scp .tmux.conf ~/.tmux.conf
scp .tmux.conf.local ~/.tmux.conf.local
scp .yabairc ~/.yabairc

# Restart shell
exec zsh
