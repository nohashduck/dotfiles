sudo pacman -Syu git lazygit openssh zsh grub neofetch imagemagick neovim nodejs ranger htop kitty wlroots seatd sway swaybg waybar fuzzel wl-clipboard grim libnotify mako alsa-lib alsa-utils pulseaudio pulsemixer ttc-iosevka ttf-iosevka-nerd
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay
yay -S vieb-bin
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
echo "default_linemode devicons" >> $HOME/.config/ranger/rc.conf
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
