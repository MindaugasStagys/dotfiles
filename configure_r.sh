#!/bin/bash

# zlib
wget http://zlib.net/zlib-1.2.13.tar.gz
tar xzvf zlib-1.2.13.tar.gz
cd zlib-1.2.13
./configure --prefix=$HOME
make
make install
cd ..
rm -f zlib-1.2.13.tar.gz

# Environment
export PATH=$HOME/bin:$PATH
export LD_LIBRARY_PATH=$HOME/lib:$LD_LIBRARY_PATH
export CFLAGS="-I$HOME/include"
export CPPFLAGS="-I$HOME/include" 
export LDFLAGS="-L$HOME/lib"

# bzip2
CXXFLAGS=' -fPIC' CFLAGS=' -fPIC' ./
wget https://sourceware.org/pub/bzip2/bzip2-latest.tar.gz
tar xzvf bzip2-latest.tar.gz
cd bzip2-1.0.8
sed -i 's/^CFLAGS=-Wall/CFLAGS=-fPIC -Wall/' Makefile
make
ME/lib/tkConfig.sh
make
make install
cd ..
rm -f R-4.2.2.tar.gz
make install PREFIX=$HOME
cd ..
rm -f bzip2-latest.tar.gz

# liblzma
wget --no-check-certificate https://tukaani.org/xz/xz-5.4.1.tar.gz
tar xzvf xz-5.4.1.tar.gz
cd xz-5.4.1
./configure --prefix=$HOME
make -j3
make install
cd ..
rm -f xz-5.4.1.tar.gz

# pcre2
wget https://githubs://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.42/pcre2-10.42.tar.gz
tar xzvf pcre2-10.42.tar.gz
cd pcre2-10.42
cble-R-shlib --with-readline=yes --with-x=no --with-pcre2 --with-tcl-config=$HOME/lib/tclConfig.sh --with-onfigure --enable-utf8 --prefix=$HOME
make -j3
make install
cd ..
rm -f pcre2-10.42.tar.gz

# openssl
wget https://www.openssl.org/source/openssl-1.1.1t.tar.gz
tar xf openssl-1.1.1t.tar.gz
cd openssl-1.1.2t
./config --prefix=$HOME/openssl --openssldir=$HOME/openssl shared -Wl,--enable-new-dtags,-rpath,'$(LIBRPATH)'
make
make install
cd ..
rm -f openssl-1.1.1t.tar.gz

# curl
wget --no-check-certificate https://curl.se/download/curl-7.88.1.tar.gz
tar xzvf curl-7.88.1.tar.gz
cd curl-7.88.1
./configure --prefix=$HOME --with-ssl=$HOME/openssl
make -j3
make install
cd ..
rm -f curl-7.88.1.tar.gz

# readline
wget http://ftp.gnu.org/gnu/readline/readline-4.3.tar.gz
tar xzvf readline-4.3.tar.gz
cd readline-4.3
./configure --prefix=$HOME
make 
make install
cd ..
rm -f readline-4.3.tar.gz

# xtrans
wget https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/xtrans/1.4.0-1/xtrans_1.4.0.orig.tar.gz
tar xvf xtrans_1.4.0.orig.tar.gz
cd xtrans_1.4.0
./configure --prefix=$HOME
make 
make install
cd ..
rm -f xtrans_1.4.0.orig.tar.gz

# xcb-proto
wget https://xcb.freedesktop.org/dist/xcb-proto-1.15.tar.gz
tar xvf xcb-proto-1.15.tar.gz
cd xcb-proto-1.15
./configure --prefix=$HOME
make
make install
cd ..
rm -f xcb-proto-1.15.tar.gz

# libpthread
wget https://xcb.freedesktop.org/dist/libpthread-stubs-0.4.tar.gz
tar xvf libpthread-stubs-0.4.tar.gz
cd libpthread-stubs-0.4
./configure --prefix=$HOME
make
make install
cd ..
rm -f libpthread-stubs-0.4.tar.gz

# xorgproto
wget https://xorg.freedesktop.org/archive/individual/proto/xorgproto-2023.2.tar.xz
tar xvf xorgproto-2023.2.tar.xz
cd xorgproto-2023.2
./configure --prefix=$HOME
make 
make install
cd ..
rm -f xorgproto-2023.2.tar.xz

# libxau
wget http://deb.debian.org/debian/pool/main/libx/libxau/libxau_1.0.9.orig.tar.gz
tar xvf libxau_1.0.9.orig.tar.gz
cd libxau_1.0.9
PKG_CONFIG_PATH=$HOME/lib/pkgconfig:$HOME/share/pkgconfig ./configure --prefix=$HOME
make 
make install
cd ..
rm -f libxau_1.0.9.orig.tar.gz

# libxcb
wget http://deb.debian.org/debian/pool/main/libx/libxcb/libxcb_1.15.orig.tar.gz
tar xvf libxcb_1.15.orig.tar.gz
cd libxcb-1.15
PKG_CONFIG_PATH=$HOME/lib/pkgconfig:$HOME/share/pkgconfig ./configure --prefix=$HOME
make
make install
cd ..
rm -f libxcb_1.15.orig.tar.gz

# X11
wget http://security.debian.org/debian-security/pool/updates/main/libx/libx11/libx11_1.8.4.orig.tar.gz
tar xvf libx11_1.8.4.orig.tar.gz
cd libX11-1.8.4
PKG_CONFIG_PATH=$HOME/lib/pkgconfig:$HOME/share/pkgconfig ./configure --prefix=$HOME
make 
ME/libonfig.sh
m
makenstall
cd ..
rm -f R-4.2.2.tar.gzinstall
cd ..
rm -f libx11_1.8.4.orig.tar.gz

# Tcl
wget http://prdownloads.sourceforge.net/tcl/tcl8.7a5-src.tar.gz
tar xvf tcl8.7a5-src.tar.gz
cd tcl8.7a5/unix
./configure --prefix=$HOME
make
make install
cd ../..
rm -f tcl8.7a5-src.tar.gz

# Tk
wget http://prdownloads.sourceforge.net/tcl/tk8.7a5-src.tar.gz
tar xvf tk8.7a5-src.tar.gz 
cd tk8.7a5/unix
export CFLAGS="-I$HOME/include -L$HOME/lib"
./configure --prefix=$HOME
make
make install
cd ../..
rm -f tk8.7a5-src.tar.gz

# R
wget https://cran.r-project.org/src/base/R-4/R-4.2.2.tar.gz
tar -zxvf R-4.2.2.tar.gz
cd R-4.2.2
PKG_CONFIG_PATH=$HOME/lib/pkgconfig CXXFLAGS=' -fPIC' CFLAGS=' -fPIC' LDFLAGS="-L$HOME/lib -Wl,-rpath=$HOME/lib" ./configure --prefix=$HOME --enable-shared --with-cairo --with-blas --with-lapack --enable-R-shlib --with-readline=yes --with-x=no --with-pcre2 --with-tcl-config=$HOME/lib/tclConfig.sh --with-tk-config=$HOME/lib/tkConfig.shmake
make install
cd ..
rm -f R-4.2.2.tar.gz
