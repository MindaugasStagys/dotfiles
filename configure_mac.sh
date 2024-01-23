#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

xcode-select --install

# Vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Oh-my-zsh and plugins
curl -O https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
bash install.sh
rm install.sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew remove vim
brew cleanup
brew install vim --with-python3
brew install htop
brew install tree
brew install tmux
brew install ack
brew install ruby
gem install colorls

brew install --cask kitty
brew install --cask miniconda

brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd

brew tap FelixKratz/formulae
brew install sketchybar

brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

yabai --start-service
skhd --start-service

# Configuration files
cp catppuccin_mocha-zsh-syntax-highlighting.zsh ~/catppuccin_mocha-zsh-syntax-highlighting.zsh
cp .zshrc ~/.zshrc
cp .vimrc ~/.vimrc
cp .p10k.zsh ~/.p10k.zsh
cp kitty.conf ~/.config/kitty/kitty.conf
cp .tmux.conf ~/.tmux.conf
cp .tmux.conf.local ~/.tmux.conf.local
cp .yabairc ~/.yabairc
cp .skhdrc ~/.skhdrc
cp -r sketchybar ~/.config/sketchybar
cp mocha.conf ~/.config/kitty/mocha.conf

curl https://bootstrap.pypa.io/get-pip.py > get-pip.py
sudo python3 get-pip.py

# Restart shell
exec zsh
