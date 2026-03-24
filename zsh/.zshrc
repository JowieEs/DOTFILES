fastfetch

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export TERM="xterm-256color"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# fnm
FNM_PATH="/home/joel/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/joel/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

alias upclink='sudo openfortivpn myupclink.upc.edu:443 --saml-login'
alias upclink-disconnect='sudo pkill openfortivpn && echo "UPCLink disconnected"'
export PATH="$HOME/.cargo/bin:$PATH"
export EDITOR="nvim"
