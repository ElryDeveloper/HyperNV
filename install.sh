scrDir=$(dirname "$(realpath "$0")")

# Install / Uninstall Packages with yay

yay -Sy google-chrome discord spotify unityhub jetbrains-toolbox virtualbox virtualbox-guest-utils hyprpaper fish nano git gnome-keyring git-credential-manager

yay -Sy lsd|fish
yay -Sy starship|fish

yay -Rs vim vi firefox brave

yay -Rsc zsh

# Set up git

git-credential-manager enable

git config --global credential.redentialStore secretservice

# Move the Dotfiles and Wallpapers

cp -rf "${scrDir}/Pictures" "$HOME"

cp -rf "${scrDir}/Dotfiles/hypr" "$HOME/.config/"

cp -rf "${scrDir}/Dotfiles/waybar" "$HOME/.config/"

cp -f "${scrDir}/Dotfiles/scripts/*" "$HOME/.local/share/bin"
 
sudo reboot now
