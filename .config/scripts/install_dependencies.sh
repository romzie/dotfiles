#! /bin/bash


### SYSTEM

## disable automatic updates
sudo systemctl stop packagekit

## add ppa
sudo add-apt-repository ppa:jonathonf/vim -y
sudo add-apt-repository ppa:papirus/papirus -y

## install packages
sudo apt update

sudo apt install -y git wget zsh build-essential dkms autoconf neofetch autojump \
    vim python3-dev python3-pip cmake numlockx libnotify-bin ranger highlight \
    papirus-icon-theme net-tools imagemagick feh mutter-common curl snapd htop \
    catimg

pip3 install i3ipc

## enable verr num on startup
sudo bash -c "echo \"greeter-setup-script=/usr/bin/numlockx on\" >> /usr/share/lightdm/lightdm.conf.d/60-lightdm-gtk-greeter.conf"

## disable auto lock
gsettings set com.ubuntu.touch.system activity-timeout 0
gsettings set com.ubuntu.touch.system dim-timeout 0
gsettings set com.ubuntu.update-notifier no-show-notifications true
gsettings set com.ubuntu.update-notifier show-apport-crashes false
gsettings set org.gnome.desktop.session idle-delay 0


### BASICS

## polybar (package not available in 20.04)
sudo apt install -y libcairo2-dev libxcb-composite0-dev libxcb-randr0-dev \
    xcb-proto libxcb1-dev libxcb-util0-dev libxcb-icccm4-dev libxcb-ewmh-dev \
    libxcb-image0-dev python3-xcbgen libxcb-xrm-dev libxcb-cursor-dev \
    libasound2-dev libnl-genl-3-dev libjsoncpp-dev
wget https://github.com/polybar/polybar/releases/download/3.4.2/polybar-3.4.2.tar
tar -xvf polybar-3.4.2.tar
rm -f polybar-3.4.2.tar
mv polybar ~/.config/polybar-source
mkdir -p ~/.config/polybar-source/build
cd ~/.config/polybar-source/build
cmake ..
make -j$(nproc)
sudo make install

## nerd fonts
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/DejaVuSansMono.zip
unzip DejaVuSansMono.zip
rm -f DejaVuSansMono.zip
fc-cache -fv

## pantheon greeter fork
sudo apt install -y gir1.2-gtkclutter-1.0 libgbm-dev libcogl-dev \
    libcogl-pango-dev libcogl-path-dev
sudo apt install -y xserver-xephyr meson libclutter-gtk-1.0-dev \
    libgdk-pixbuf2.0-dev libgee-0.8-dev libgtk-3-dev liblightdm-gobject-1-dev \
    libx11-dev valac
git clone https://github.com/nick92/Enso-OS.git ~/.config/Enso-OS

## i3lock-color
sudo apt install -y pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev \
    libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev \
    libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util-dev \
    libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev
git clone https://github.com/Raymo111/i3lock-color.git ~/.config/i3lock-color
cd ~/.config/i3lock-color
bash install-i3lock-color.sh


### CLI UTILITIES

## lsd
wget https://github.com/Peltoche/lsd/releases/download/0.17.0/lsd_0.17.0_amd64.deb
sudo dpkg -i lsd_0.17.0_amd64.deb
rm -f lsd_0.17.0_amd64.deb

## bat
wget https://github.com/sharkdp/bat/releases/download/v0.15.4/bat_0.15.4_amd64.deb
sudo dpkg -i bat_0.15.4_amd64.deb
rm -f bat_0.15.4_amd64.deb

## fx
wget https://github.com/antonmedv/fx/releases/download/18.0.1/fx-linux.zip
unzip fx-linux.zip
rm -f fx-linux.zip
sudo mv fx-linux /usr/local/bin/fx

## ytop
wget https://github.com/cjbassi/ytop/releases/download/0.6.2/ytop-0.6.2-x86_64-unknown-linux-gnu.tar.gz
tar -xvf ytop-0.6.2-x86_64-unknown-linux-gnu.tar.gz
sudo mv ytop /usr/local/bin/ytop
rm -f ytop-0.6.2-x86_64-unknown-linux-gnu.tar.gz


### MISC

## hapycolor
pip3 install colormath scipy imgur_downloader sklearn docopt
git clone --branch 16colors https://github.com/rvdz/hapycolor.git ~/.config/hapycolor

## pipes
git clone https://github.com/pipeseroni/pipes.sh.git ~/.config/pipes
cd ~/.config/pipes
sudo make install

## cmatrix
sudo apt install -y cmatrix

## tetris
sudo snap install tetris-thefenriswolf

## mine sweeper
git clone https://github.com/unknownblueguy6/MineSweeper.git ~/.config/mine-sweeper
cd ~/.config/mine-sweeper
make

## 2048
git clone https://github.com/plibither8/2048.cpp.git ~/.config/2048
mkdir -p ~/.config/2048/build
cd ~/.config/2048/build
cmake ../
sudo cmake --build . --target install

## solitaire
sudo apt install -y libncurses5-dev libncursesw5-dev
wget -O tty-solitaire-1.3.0.tar.gz https://github.com/mpereira/tty-solitaire/archive/v1.3.0.tar.gz
tar xvf tty-solitaire-1.3.0.tar.gz
mv tty-solitaire-1.3.0 ~/.config/tty-solitaire
cd ~/.config/tty-solitaire
make -j$(nproc)
sudo make install


### OH MY ZSH

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cd $HOME

###
