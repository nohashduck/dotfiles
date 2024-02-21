sudo pacman -Syu neofetch kitty neovim ranger htop firefox sway swaybg waybar fuzzel mako pulseaudio alsa-lib alsa-utils grim wl-clipboard libnotify zsh cantarell-fonts ttc-iosevka ttf-iosevka-nerd

mkdir /home/$(whoami)/Pictures
yes | sudo cp -rf ../images/wallpaper.jpg /home/$(whoami)/Pictures/Wallpaper.jpg
yes | sudo cp -rf ./grim /home/$(whoami)/.config/grim
yes | sudo cp -rf ./kitty /home/$(whoami)/.config/kitty
yes | sudo cp -rf ./mako /home/$(whoami)/.config/mako
yes | sudo cp -rf ./nvim /home/$(whoami)/.config/nvim
yes | sudo cp -rf ./sway /home/$(whoami)/.config/sway
yes | sudo cp -rf ./waybar /home/$(whoami)/.config/waybar
yes | sudo cp -rf ./neofetch /home/$(whoami)/.config/neofetch
yes | sudo cp -rf ./fuzzel /home/$(whoami)/.config/fuzzel
yes | sudo cp -rf ./zsh/.zshrc /home/$(whoami)/.zshrc

git clone https://github.com/alexanderjeurissen/ranger_devicons /home/$(whoami)/.config/ranger/plugins/ranger_devicons

sudo chmod -R 777 /home/$(whoami)

git clone https://github.com/nohashduck/grub.git
yes | sudo cp -r grub/grub/theme /usr/share/grub/themes/grub
sudo sed -i "s/#GRUB_THEME=.*/GRUB_THEME=/" /etc/default/grub
sudo sed -i "s/GRUB_THEME=.*/GRUB_THEME=\/usr\/share\/grub\/themes\/grub/theme.txt" /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
