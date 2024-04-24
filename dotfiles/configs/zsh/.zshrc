export ZSH=$HOME/.oh-my-zsh;
ZSH_THEME="agnoster"
plugins=(git)
source $ZSH/oh-my-zsh.sh

export XDG_CURRENT_DESKTOP=sway
if [ "$(tty)" = "/dev/tty1" ]; then
	exec sway
fi
