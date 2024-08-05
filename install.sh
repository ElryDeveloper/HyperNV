scrDir=$(dirname "$(realpath "$0")")

# Install / Uninstall Packages with yay

yay -Sy google-chrome discord spotify unityhub jetbrains-toolbox virtualbox virtualbox-guest-utils hyprpaper fish nano git gnome-keyring git-credential-manager

yay -Sy lsd|fish
yay -Sy starship|fish

yay -Rs vim vi firefox brave flatpak || true

yay -Rsc zsh || true

# Set up git

git-credential-manager configure

git config --global credential.credentialStore secretservice

git config --global credential.helper /usr/lib/git-core/git-credential-libsecret

git config --global http.postBuffer 2147483648

# Move the Dotfiles and Wallpapers

cp -rf "${scrDir}/Pictures" "$HOME"

cp -rf "${scrDir}/Dotfiles/hypr" "$HOME/.config/"

cp -rf "${scrDir}/Dotfiles/waybar" "$HOME/.config/"

cp -f "${scrDir}/Dotfiles/scripts/gpuinfo.sh" "$HOME/.local/share/bin/"

cp -f "${scrDir}/Dotfiles/scripts/cpuinfo.sh" "$HOME/.local/share/bin/"
 
#sudo reboot now
