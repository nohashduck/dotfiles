export ZSH=$HOME/.oh-my-zsh;
ZSH_THEME="agnoster"
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

if [ "$(tty)" = "/dev/tty1" ]; then
    exec sway
fi
