alias h=history

# Tig
alias ts='tig status'

alias l='ls --color=auto'
alias ll='l -l'
alias la='ll -a'
alias lt='ll -tr'
alias lg='lazygit'
alias netstat_osx="sudo lsof -i -P"
alias g='git'
alias gf='g fetch'
alias gr='git rev-parse --show-toplevel'
alias cdgr='cd "$(gr)"'
alias gsu='git submodule update'
alias gst='git status'
alias st='nocorrect stree'
alias pwgen='nocorrect pwgen'
alias igrep='grep -i'
# Juzl's fzf/git aliases
alias fbr='git branch -a | fzf | sed "s/remotes\/origin\///"'
alias fbc='fbr | pbcopy'
alias fco='fbr | xargs git checkout'
alias e='eza -l'
alias ea='e -a'
alias etr='eza --tree'
alias et='ea --sort new'
alias ta='et -a'
alias t1='et --level=1'
alias t2='et --level=2'
alias t3='et --level=3'
alias rgh='function _rgh() { rg "$@" --glob ''~/Dropbox/dev/backup/.zsh_history.*''; };_rgh'
