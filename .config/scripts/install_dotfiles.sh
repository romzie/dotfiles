#! /bin/bash


### SHELL

## oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git /home/$USER/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/$USER/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git /home/$USER/.oh-my-zsh/custom/plugins/you-should-use
git clone https://github.com/marlonrichert/zsh-autocomplete.git /home/$USER/.oh-my-zsh/custom/plugins/zsh-autocomplete
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins.git /home/$USER/.oh-my-zsh/custom/plugins/autoupdate
git clone https://github.com/zpm-zsh/title.git /home/$USER/.oh-my-zsh/custom/plugins/title

## resh
git clone https://github.com/curusarn/resh.git ~/.config/resh
cd ~/.config/resh
bash scripts/rawinstall.sh
cd


### DOTFILES

# ranger
ranger --copy-config=all

# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/$USER/.oh-my-zsh/custom/themes/powerlevel10k

# fetch bare repo
echo ".config/dotfiles" >> .gitignore
git clone --bare https://github.com/romzie/dotfiles.git $HOME/.config/dotfiles
dotfiles() {
    git --git-dir=$HOME/.config/dotfiles --work-tree=$HOME $@
}
dotfiles checkout
if [[ $? -ne 0 ]]; then
    dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} rm -f {}
fi
dotfiles checkout
dotfiles config status.showUntrackedFiles no


### OTHER THEME RELATED STUFF

## plymouth theme
wget https://github.com/adi1090x/files/raw/master/plymouth-themes/themes/pack_1/cuts_alt.tar.gz
tar -xzvf cuts_alt.tar.gz
sudo mv cuts_alt /usr/share/plymouth/themes/cuts_alt
sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/cuts_alt/cuts_alt.plymouth 100
sudo update-initramfs -u
rm -f cuts_alt.tar.gz

## vim
git clone --depth=1 https://github.com/romzie/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
cd ~/.vim_runtime
git submodule update --init --recursive
cd ~/.vim_runtime/sources_non_forked/youcompleteme
python3 install.py
cd

## hapycolor
git clone https://github.com/rvdz/hapycolor ~/.config/hapycolor


### refresh theme
regolith-look refresh


### reboot to finish installation
reboot


### following setup is optional

## git
#git config --global user.email "my.email@here.fr"
#git config --global user.name "My Name"

###
