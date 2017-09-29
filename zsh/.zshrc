# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes or in ~/.oh-my-zsh/themes/
ZSH_THEME="robbyrussell"
#ZSH_THEME="robharrop"
#ZSH_THEME="intheloop"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git rbenv gem bundler rake brew osx vagrant gpg-agent pass)
plugins=(git rbenv gem bundler rake brew osx vagrant pass)

source_file_if_exists () {
    [[ -f "$1" ]] && source "$1"
}

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='subl -n -w'
fi

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/Dropbox/dev/backup/.zsh_history.$HOST

# gpg-agent
#local GPG_ENV=$HOME/.gnupg/gpg-agent.env
#function start_agent {
#  /usr/bin/env gpg-agent --daemon --write-env-file ${GPG_ENV} > /dev/null
#  chmod 600 ${GPG_ENV}
#  . ${GPG_ENV} > /dev/null
#}
## Source GPG agent settings, if applicable
#if [ -f "${GPG_ENV}" ]; then
#  . ${GPG_ENV} > /dev/null
#  GPG_AGENT_DATA=("${(s/:/)GPG_AGENT_INFO}")
#  GPG_AGENT_PID=$GPG_AGENT_DATA[2]
#  ps -ef | grep ${GPG_AGENT_PID} | grep gpg-agent > /dev/null || {
#    start_agent;
#  }
#else
#  start_agent;
#fi
#export GPG_AGENT_INFO
#export GPG_AGENT_PID
#GPG_TTY=$(tty)
#export GPG_TTY

# Customize to your needs...
export ANACONDA_HOME=$HOME/anaconda
export MYSQL_HOME=/usr/local/mysql
export JAVA_7_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home/
export JAVA_8_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_112.jdk/Contents/Home/
export JAVA_HOME=$JAVA_8_HOME
export GOPATH=$HOME/code/go
export RBENV_ROOT=/usr/local/var/rbenv
export PATH=/usr/local/bin:/usr/local/share/python:/opt/local/bin:/usr/local/sbin:$MYSQL_HOME/bin:~/bin:~/pear/bin:$PATH
#export PATH=/usr/local/bin:/opt/local/bin:/usr/local/sbin:$MYSQL_HOME/bin:~/bin:~/pear/bin:$PATH
export PATH="$HOME/.rbenv/bin:$HOME/.umbrella/bin:$GOPATH/bin:$PATH:$ANACONDA_HOME/bin"
export PATH="$(brew --prefix qt@5.5)/bin:$PATH"
#export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"
export BANCO=~/code/gh/firstbanco
export PASSWORD_STORE_DIR=.
if [[ -f "$1" ]]; then
  export HOMEBREW_GITHUB_API_TOKEN=$(cat ~/.homebrew-github-access-token)
fi

# timeout is in ms (10_000_000)
export PGOPTIONS="-c statement_timeout=10000000"
export PROD_DEPLOYS=~/Dropbox\ \(First\ Banco\ Limited\)/Dept\ Development/Production\ Deploys/

source_file_if_exists ~/.vostron.env
#source ~/.aws_env
#source ~/.aws_cred
#source ~/.opscode_env
mkdir -p ~/.ssh/sockets

alias h=history

# Zeus
alias z=zeus
alias zg='z generate'
alias zgm='zg migration'
alias zst='z start'
alias zs='z spec'
alias zss='z spec spec'
alias zr='zeus rake'
alias zrdm='zr db:migrate'
alias zrdms='zr db:migrate:status'
alias zrdr='zr db:rollback'
alias zrdtp='zr db:test:prepare'

# Spring
alias s=spring
alias sg='s generate'
alias sgm='sg migration'
alias ss='s spec'
alias srs='s rspec'
alias sr='s rake'
alias srdm='sr db:migrate'
alias srdms='sr db:migrate:status'
alias srdr='sr db:rollback'
alias srdtp='sr db:test:prepare'

alias lt='ll -tr'
alias netstat_osx="sudo lsof -i -P"
alias fb='cd $BANCO'
alias um='cd $BANCO/umbrella'
alias um2='cd $BANCO/umbrella2'
alias um3='cd $BANCO/umbrella3'
alias gf='g fetch'
alias gr='cd `git rev-parse --show-toplevel`'
alias gsu='git submodule update'
alias gst='git st'
alias rgfa='rake git:fetch:all'
alias rgma='rake git:merge:all'
alias rgla='rake git:pull:all'
alias rgpa='rake git:push:all'
alias st='nocorrect stree'
alias pwgen='nocorrect pwgen'
alias tc='truecrypt -t'
alias igrep='grep -i'
# Juzl's fzf/git aliases
alias fbr='git branch -a | fzf | sed "s/*//"'
alias fbc='fbr | pbcopy'
alias fco='fbr | xargs git checkout'
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

zmodload zsh/complist
autoload -U compinit
compinit -u
autoload -U colors
colors
zstyle ':completion:*' show-ambiguity "1;$color[fg-red]"

PATH="/Users/joe/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/Users/joe/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/joe/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/joe/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/joe/perl5"; export PERL_MM_OPT;

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.bamboorc ] && source ~/.bamboorc