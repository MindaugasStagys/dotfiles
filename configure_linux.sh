#!/bin/bash

cp .bash_profile ~/.bash_profile
cp .zshrc ~/.zshrc
cp .vimrc ~/.vimrc
cp .p10k.zsh ~/.p10k.zsh
cp .tmux.conf ~/.tmux.conf
cp .tmux.conf.local ~/.tmux.conf.local
cp catppuccin_mocha-zsh-syntax-highlighting.zsh ~/catppuccin_mocha-zsh-syntax-highlighting.zsh

source ~/.bash_profile

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

# ncurses
wget http://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.4.tar.gz
tar xzf ncurses-6.4.tar.gz
cd ncurses-6.4
export CXXFLAGS=' -fPIC'
export CFLAGS=' -fPIC'
./configure --prefix=$HOME/opt/ncurses --enable-shared
make
make install
cd ..
rm -f ncurses-6.4.tar.gz

INSTALL_PATH='$HOME/opt/ncurses'
export PATH=$INSTALL_PATH/bin:$PATH
export LD_LIBRARY_PATH=$INSTALL_PATH/lib:$LD_LIBRARY_PATH
export CFLAGS=-I$INSTALL_PATH/include
export CPPFLAGS="-I$INSTALL_PATH/include" LDFLAGS="-L$INSTALL_PATH/lib"
export LIBS="-L$INSTALL"

# zsh
wget -O zsh.tar.xz https://sourceforge.net/projects/zsh/files/latest/download
mkdir zsh && unxz zsh.tar.xz && tar -xvf zsh.tar -C zsh --strip-components 1
cd zsh
./configure --prefix=$HOME CFLAGS="-I$HOME/opt/ncurses/include" CXXFLAGS="-I$HOME/opt/ncurses/include" CPPFLAGS="-I$HOME/opt/ncurses/include" LIBS="-L$HOME/opt/ncurses/lib"
make
make install
cd ..
rm -f zsh.tar

# Oh-my-zsh and plugins
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
bash install.sh
rm install.sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Vim-plug
mkdir -p ~/.vim/autoload/
cd ~/.vim/autoload/
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
rm -f Miniconda3-latest-Linux-x86_64.sh

# tmux
conda install -c conda-forge tmux

