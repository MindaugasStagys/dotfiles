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
./configure --prefix=$HOME --enable-shared
make
make install
cd ..
rm -f ncurses-6.4.tar.gz

# zsh
wget -O zsh.tar.xz https://sourceforge.net/projects/zsh/files/latest/download
mkdir zsh && unxz zsh.tar.xz && tar -xvf zsh.tar -C zsh --strip-components 1
cd zsh
./configure --prefix=$HOME CFLAGS="-I$HOME/include" CXXFLAGS="-I$HOME/include" CPPFLAGS="-I$HOME/include" LIBS="-L$HOME/lib"
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
rm -f install.sh

# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Newest Vim
git clone https://github.com/vim/vim.git
cd vim
./configure --prefix=$HOME --with-features=huge --enable-multibyte --enable-rubyinterp --enable-python3interp --enable-perlinterp --enable-luainterp
make
make install
cd ..

# Vim-plug
mkdir -p ~/.vim/autoload/
cd ~/.vim/autoload/
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cd ~

# libevent
wget https://github.com/libevent/libevent/releases/download/release-2.1.12-stable/libevent-2.1.12-stable.tar.gz
tar xvf libevent-2.1.12-stable.tar.gz
cd libevent-2.1.12-stable
./configure --prefix=$HOME
make
make install
cd ..
rm -f libevent-2.1.12-stable.tar.gz

# Environment
export PATH=$HOME/bin:$PATH
export LD_LIBRARY_PATH=$HOME/lib:$LD_LIBRARY_PATH
export CFLAGS="-I$HOME/include"
export CPPFLAGS="-I$HOME/include"
export LDFLAGS="-L$HOME/lib"

# tmux
wget https://github.com/tmux/tmux/releases/download/3.3a/tmux-3.3a.tar.gz
tar xvf tmux-3.3a.tar.gz
cd tmux-3.3a
./configure --prefix=$HOME
make
make install
cd ..
rm -f tmux-3.3a.tar.gz

# Miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
rm -f Miniconda3-latest-Linux-x86_64.sh
