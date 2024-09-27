sudo cp -r ./dotfiles/etc/* /etc
sudo cp -r ./dotfiles/boot/* /boot
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo pacman -S git
git clone https://github.com/alexanderjeurissen/ranger_devicons /home/nohashduck/.config/ranger/plugins/ranger_devicons
sudo cp -r ./dotfiles/home/nohashduck/* /home/nohashduck
sudo pacman -S neovim unzip ripgrep nodejs
sudo pacman -S lazygit openssh
sudo pacman -S neofetch imagemagick
sudo pacman -S ranger
sudo pacman -S kitty
sudo pacman -S htop
sudo pacman -S wlroots seatd sway swaybg waybar fuzzel
sudo pacman -S wl-clipboard grim
sudo pacman -S libnotify mako
sudo pacman -S firefox
sudo pacman -S ttc-iosevka ttf-iosevka-nerd
sudo pacman -S pulsemixer
sudo pacman -S zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
