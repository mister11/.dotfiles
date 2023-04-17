# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

alias cl='clear'
alias py3='python3'
alias gtfo='git reset --hard HEAD'

# List direcory contents
alias ls='exa'
alias l='exa -lah'
alias ll='exa -lh'

# git
alias gitCleanEnhancementBranches='git branch | egrep "enhancement/.*" | xargs git branch -d'
alias gitCleanFixBranches='git branch | egrep "fix/.*" | xargs git branch -d'
alias gitCleanFeatureBranches='git branch | egrep "feature/.*" | xargs git branch -d'
# get branch name
alias gbnm="git rev-parse --abbrev-ref HEAD | xclip -sel clip"
alias gtfo='git reset --hard HEAD'

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
alias fck='fuck'
alias nn='nvim .'

#mix
alias mdg='mix deps.get'
alias mdu='mix deps.update --all'
alias mc='mix compile'
alias mf='mix format'
alias mtt='mix test --trace'
alias mttt='mix test --trace --only sven'
alias iexm='iex --no-pry -S mix'
alias iexp='iex --no-pry -S mix phx.server'
alias elsr='rm -rf .elixir_ls'
alias elsrh='rm -rf deps _build .elixir_ls && mix deps.get'

#project helpers (work specific)
alias mrpd='mix run platform/local/provision_dynamo_tables.exs'
alias pkt='source platform/local/provision-kafka-topics.sh'

#k8s
alias kctx='kubectx'
alias kns='kubens'
alias kctlr='sh ~/scripts/k8s/run-kafkactl-container.sh'
alias kctld='sh ~/scripts/k8s/delete-kafkactl-container.sh'

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

commits() {
    echo "chore (updating .gitignore, platform/local files)
ci (ONLY FOR CI!)
docs (changes to the documentation)
feat (new feature, branch merge etc.)
fix (bug fix)
refactor (refactoring code, eg. renaming a variable, moving to new module etc.)
style (mix.format)
test (adding missing tests, refactoring tests)"
}

# this fixes delta's broken completion in zsh
dff() {
    delta $1 $2
}

ksh() {
    keti "$1" -- bash
}

kshfz() {
    selected=$(kgp | fzf | cut -d ' ' -f1)
    if [[ ! -z $selected ]]; then
        echo "Selected project: $selected"
        keti "$selected" -- bash
    fi
}

kdelpfz() {
    selected=$(kgp | fzf | cut -d ' ' -f1)
    read "?You will delete $selected pod. Are you sure? "
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Deleting pod $selected..."
        kdelp $selected
    else
        echo "Pod deletion skipped."
    fi
}

kdpfz() {
    selected=$(kgp | fzf | cut -d ' ' -f1)
    if [[ ! -z $selected ]]; then
        echo "Selected project: $selected"
        kdp "$selected"
    fi
}

alias grep_port="sudo lsof -i -P -n | grep"

