scrDir=$(dirname "$(realpath "$0")")

"${scrDir}/Scripts/install_hyprdots.sh"

cp "${scrDir}/monitors.conf" "${scrDir}/Dotfiles/hypr"

cp -rf "${scrDir}/Pictures" "$HOME"

cp -rf "${scrDir}/Dotfiles/hypr" "$HOME/.config/"

cp -rf "${scrDir}/Dotfiles/waybar" "$HOME/.config/"

reboot now