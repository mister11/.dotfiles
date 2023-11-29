alias ls='eza'
alias l='eza -lah'
alias ll='eza -lh'
alias bat='bat --style=plain --theme=gruvbox-dark'
alias cat='bat --style=plain --theme=gruvbox-dark'

# git
alias gbnm="git rev-parse --abbrev-ref HEAD | xclip -sel clip"
alias gtfo='git reset --hard HEAD'
alias ghpr='gh pr create -w'

gdfz() {
    if [ -z "$1"]; then
        selected=$(git log --pretty="%h - %s (%an)" | fzf | cut -d " " -f1)
    else
        selected="$1"
    fi
    git diff $selected^1..$selected
}

gccfz() {
    selected=$(git log --pretty="%h - %s (%an)" | fzf --ansi | cut -d " " -f1)
    git checkout $selected
}

# gradlew
alias gwst='./gradlew --stop'
alias gwcl='./gradlew clean'
alias gwbd='./gradlew build'
alias gwbr='./gradlew bootRun'
alias gw='./gradlew'
alias gwt='./gradlew test'

# Docker
alias dk='docker'
alias dkils='docker images'
alias dki='docker image'
alias dkc='docker container'
alias dkex='docker exec -it'
alias dkps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"'
alias dkpsa='docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"'

#misc
alias uuid='uuidgen | xclip -sel clip'
alias clip='xclip -sel clip'
alias open='xdg-open'
alias nn='nvim .'

#mix
alias mdg='mix deps.get'
alias mdu='mix deps.update --all'
alias mc='mix compile'
alias mcr='mix credo'
alias mf='mix format'
alias mtt='mix test --trace'
alias mttp='iex -S mix test --trace'
alias mttt='mix test --trace --only sven'
alias mtttp='iex -S mix test --trace --only sven'
alias iexm='iex --no-pry -S mix'
alias iexmn='iex --no-pry --sname $(basename $(pwd) | tr "-" "_") -S mix'
alias iexp='iex --no-pry -S mix phx.server'
alias elsr='rm -rf .elixir_ls'
alias elsrh='rm -rf deps _build .elixir_ls && mix deps.get'

extract() {
  if [ -z "$1" ]; then
    echo "Usage: extract <path>"
  else
    if [ -f $1 ]; then
      case $1 in
        *.tar.bz2)   tar xvjf $1    ;;
        *.tar.gz)    tar xvzf $1    ;;
        *.tar.xz)    tar xvJf $1    ;;
        *.lzma)      unlzma $1      ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar x -ad $1 ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xvf $1     ;;
        *.tbz2)      tar xvjf $1    ;;
        *.tgz)       tar xvzf $1    ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
        *.xz)        unxz $1        ;;
        *)           echo "extract: '$1' - unknown archive method" ;;
      esac
    else
      echo "$1 - file does not exist"
    fi
  fi
}

# this fixes delta's broken completion in zsh
dff() {
    delta $1 $2
}

alias grep_port="sudo lsof -i -P -n | grep"

# add additional aliases
personal_aliases="~/.personal/zsh_aliases"
if [[ -f "$personal_aliases" ]]; then
   source "$personal_aliases"
fi
