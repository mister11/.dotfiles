# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="dpoggi"
ENABLE_CORRECTION="true"
DISABLE_MAGIC_FUNCTIONS="true"

plugins=(asdf git mix golang docker docker-compose zsh-autosuggestions zsh-syntax-highlighting)

# setup private stuff
# keep this after plugins as it add home/work specific plugins
personal_zsh="~/.personal/zsh"
if [[ -f "$personal_zsh" ]]; then
   source "$personal_zsh"
fi

source $ZSH/oh-my-zsh.sh

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

export TERM=xterm-256color
export EDITOR=nvim

export FLYCTL_INSTALL="/home/mister11/.fly"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.pulumi/bin:$PATH"
export PATH="$HOME/.local/kitty.app/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export PATH="$HOME/.asdf/shims:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export RANGER_LOAD_DEFAULT_RC=FALSE


unsetopt correct_all

export ERL_AFLAGS="-kernel shell_history enabled"

fpath=(~/.zsh/completion $fpath)
fpath=(~/.asdf/completions $fpath)

autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit

# shortcuts
bindkey -s '^f' 'tmux-sessionizer\n' 

source /usr/share/fzf/key-bindings.zsh
source $HOME/.local/bin/socli_completions
source $HOME/.local/bin/flyctl_completions

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
source "/home/mister11/.sdkman/bin/sdkman-init.sh"
