# Path to your oh-my-zsh installation.
export ZSH=/home/mister11/.oh-my-zsh

# setup private stuff
source ~/.personal/zsh

ZSH_THEME="dpoggi"
ENABLE_CORRECTION="true"
DISABLE_MAGIC_FUNCTIONS="true"
plugins=(git gcloud mix golang docker docker-compose zsh-autosuggestions zsh-completions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export FLYCTL_INSTALL="/home/mister11/.fly"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.pulumi/bin:$PATH"
export PATH="$HOME/.local/kitty.app/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

export RANGER_LOAD_DEFAULT_RC=FALSE

fpath=(~/.zsh/completion $fpath)

unsetopt correct_all

export ERL_AFLAGS="-kernel shell_history enabled"

eval $(thefuck --alias)

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/mister11/.sdkman"
[[ -s "/home/mister11/.sdkman/bin/sdkman-init.sh" ]] && source "/home/mister11/.sdkman/bin/sdkman-init.sh"
eval "$(zoxide init zsh)"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

# shortcuts
bindkey -s '^f' 'tmux-sessionizer\n' 

source /usr/share/nvm/init-nvm.sh
source /usr/share/fzf/key-bindings.zsh
source /opt/asdf-vm/asdf.sh
