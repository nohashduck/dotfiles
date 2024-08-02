export ZSH=$HOME/.oh-my-zsh;
ZSH_THEME="agnoster"
plugins=(git)
source $ZSH/oh-my-zsh.sh
export VISUAL=nvim;
export EDITOR=nvim;

if [ "$(tty)" = "/dev/tty1" ]; then
	exec sway
fi
