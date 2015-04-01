#!/bin/bash

# Copied from here: https://gist.githubusercontent.com/ravishi/3706813/raw/624016914feadf43c210df5e7bb5b0297af7d0ce/ubuntu-post-install.sh

##
sudo apt-get install -y build-essential aria2 git  \
    fonts-inconsolata unzip unrar p7zip-full ack-grep vim
 
# Install JDK 8
sudo add-apt-repository -y ppa:webupd8team/java 
sudo apt-get update 
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get -y install oracle-java8-installer 
update-java-alternatives -s java-8-oracle

# Install Intellij
wget -O /tmp/intellij.tar.gz http://download.jetbrains.com/idea/ideaIC-14.0.1.tar.gz 
tar xfz /tmp/intellij.tar.gz 



##
## Setup the Solarized Dark theme for gnome-terminal
##
gtcbin="`(mktemp -d)`/solarize"
git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git "`(dirname \"$gtcbin\")`"
"$gtcbin" dark

# Unity Look and Feel
sudo add-apt-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install numix-gtk-theme numix-icon-theme-circle
sudo apt-get install numix-wallpaper-*
sudo apt-get install unity-tweak-tool

# Cisco/VPN
sudo apt-get install network-manager-openconnect

##
## Setup Prezto
##
sudo apt-get install -y git zsh
 
git clone --recursive https://github.com/ravishi/prezto.git "$HOME/.zprezto"
 
shopt -s extglob
for rcfile in $HOME/.zprezto/runcoms/!(README.md); do
  ln -s "$rcfile" "$HOME/.$(basename $rcfile)"
done
 
# XXX since we are using sudo for everything else, this is better than the
# usual chsh, which would request another password right in the middle of the
# script execution
sudo usermod -s /bin/zsh "$(whoami)"
 
 
## 
## Setup VIM
##
sudo apt-get install -y vim-gnome 
git clone http://github.com/tlazaro/vim-scala-setup ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule update --init

# Install Airline
git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline

#git clone --recursive https://github.com/ravishi/dotvim "$HOME/.vim"

# powerline fancy symbols
mkdir -p "$HOME/.fonts/" "$HOME/.config/fontconfig/conf.d/"
wget -P "$HOME/.fonts/" https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
fc-cache -vf "$HOME/.fonts"
wget -P "$HOME/.config/fontconfig/conf.d/" https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf


##
## Google Chrome
##
sudo su -c 'echo "# Google software repository
deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-get update -y

# we need --force-yes because chrome is not an authenticated package
sudo apt-get install -y --force-yes google-chrome-beta

 
##
## XMonad
##
#sudo apt-get install -y xmonad libghc-xmonad-contrib-dev gnome-session-fallback
#if [ ! -d "$HOME/.xmonad" ]; then
#    mkdir "$HOME/.xmonad"
#fi
#wget -O "$HOME/.xmonad/xmonad.hs" https://gist.github.com/ravishi/4154309/raw/xmonad.hs

# disable global Super+P shortcut, which conflicts with XMonads Super+P
#dconf write /org/gnome/settings-daemon/plugins/xrandr/active false


##
## Misc stuff
##

# Better font rendering (aka Infinality)
# source: http://www.webupd8.org/2013/06/better-font-rendering-in-linux-with.html
sudo add-apt-repository -y ppa:no1wantdthisname/ppa \
    && sudo apt-get update \
    && sudo apt-get install -y fontconfig-infinality

# Turn off apport
sudo su -c 'echo "enabled=0" > /etc/default/apport'

#
# Remove Ubuntu One
# source: http://askubuntu.com/questions/309122/removing-ubuntu-one
killall ubuntuone-login ubuntuone-preferences ubuntuone-syncdaemon

sudo rm -rf "$HOME//.local/share/ubuntuone" "$HOME//.cache/ubuntuone" "$HOME//.config/ubuntuone"

mv "$HOME/Ubuntu One/" "$HOME/Ubuntu One Backup/"

sudo apt-get remove -y --purge 'ubuntuone-*'

# Docker
sudo apt-get install docker.io

# Other utils
sudo apt-get install clusterssh gitg pidgin

##
## And to finish it, a dist-upgrade to install/update them all.
##
sudo apt-get update && sudo apt-get dist-upgrade -y
 
# vim: set tw=0:
