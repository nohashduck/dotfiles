sudo pacman -S zsh
if [ $? -eq 0 ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &
    cp -rf ./configs/zsh/.zshrc /home/nohashduck/.zshrc
    rm /home/nohashduck/.bash_history
    rm /home/nohashduck/.bash_logout
    rm /home/nohashduck/.bash_profile
    rm /home/nohashduck/.bashrc
fi

sudo pacman -S grub
if [ $? -eq 0 ]; then
    git clone https://github.com/nohashduck/grub.git
    sudo cp -rf grub/grub/theme /usr/share/grub/themes/grub
    sudo sed -i "s/#GRUB_THEME=.*/GRUB_THEME=/" /etc/default/grub
    sudo sed -i "s/GRUB_THEME=.*/GRUB_THEME=\/usr\/share\/grub\/themes\/grub/theme.txt" /etc/default/grub
    sudo grub-mkconfig -o /boot/grub/grub.cfg
fi

sudo pacman -S neofetch
if [ $? -eq 0 ]; then
    cp -rf ./configs/neofetch/ /home/nohashduck/.config/neofetch/
fi

sudo pacman -S neovim
if [ $? -eq 0 ]; then
    cp -rf ./configs/neovim/ /home/nohashduck/.config/nvim/
fi

sudo pacman -S ranger
if [ $? -eq 0 ]; then
    git clone https://github.com/alexanderjeurissen/ranger_devicons /home/nohashduck/.config/ranger/plugins/ranger_devicons/
    echo "default_linemode devicons" >> /home/nohashduck/.config/ranger/rc.conf
fi

sudo pacman -S htop

sudo pacman -S kitty
if [ $? -eq 0 ]; then
    cp -rf ./configs/kitty/ /home/nohashduck/.config/kitty/
fi

sudo pacman -S sway
if [ $? -eq 0 ]; then
    cp -rf ./configs/sway/ /home/nohashduck/.config/sway/
    mkdir -p /home/nohashduck/Pictures/
    cp -rf ./images/wallpaper.jpg /home/nohashduck/Pictures/Wallpaper.jpg
fi

sudo pacman -S waybar
if [ $? -eq 0 ]; then
    cp -rf ./configs/waybar/ /home/nohashduck/.config/waybar/
fi

sudo pacman -S fuzzel
if [ $? -eq 0 ]; then
    cp -rf ./configs/fuzzel/ /home/nohashduck/.config/fuzzel/
fi

sudo pacman -S grim
if [ $? -eq 0 ]; then
    cp -rf ./configs/mako/ /home/nohashduck/.config/grim/
fi

sudo pacman -S mako
if [ $? -eq 0 ]; then
    cp -rf ./configs/mako/ /home/nohashduck/.config/mako/
fi

sudo pacman -S firefox
sudo pacman -S cantarell-fonts ttc-iosevka ttf-iosevka-nerd
