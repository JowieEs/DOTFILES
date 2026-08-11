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
alias gitClean="git branch -vv | grep ': gone]' | awk '{if (\$1 == \"*\") print \$2; else print \$1}' | xargs -r git branch -d"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:$HOME/.local/bin
export EDITOR="nvim"
export ANDROID_HOME=$HOME/Android/Sdk
export JAVA_HOME="/usr/lib/jvm/default"
export _JAVA_AWT_WM_NONREPARENTING=1
export MOZ_ENABLE_WAYLAND=1
bindkey -v
