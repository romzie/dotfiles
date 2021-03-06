# romzie's dotfiles
This is a git bare repository.

My config:

* DE: Regolith 1.4
* WM: i3-gaps
* Terminal: gnome-terminal
* Font: DejaVu Sans Mono Nerd Font
* Status bar: polybar
* Editor: vim

### Pre-installation steps from VirtualBox VM on Windows 10

Mount the Guest Additions ISO to access all screen resolutions and follow the
2 next steps :

`sudo apt install -y build-essential dkms`

`sudo bash /media/$USER/vbox_mounted_device/autorun.sh` 

To allow user to access shared folders (after installing the Guest Additions):

`sudo adduser $USER vboxsf`

### Installation from scratch

`bash -c "$(wget -O- https://raw.githubusercontent.com/romzie/dotfiles/master/.config/scripts/install_dependencies.sh)"`

`bash -c "$(wget -O- https://raw.githubusercontent.com/romzie/dotfiles/master/.config/scripts/install_dotfiles.sh)"`

## Bug fixes

### gnome-control-center (already done in install script)

If gnome-control-center fails to launch with error `Settings schema org.gnome.mutter is not installed`,
it is a known issue (see https://bugs.launchpad.net/ubuntu/+source/gnome-control-center/+bug/1875243).
Just do `sudo apt install mutter-common` to solve this.
