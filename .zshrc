# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
# ZSH_THEME="robharrop"
ZSH_THEME="intheloop"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(ssh-agent git rbenv gem bundler rake brew osx vagrant gpg-agent pass)

source $ZSH/oh-my-zsh.sh

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
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
export GOPATH=$HOME/code/go
export RBENV_ROOT=/usr/local/var/rbenv
export PATH=/usr/local/bin:/usr/local/share/python:/opt/local/bin:/usr/local/sbin:$MYSQL_HOME/bin:~/bin:~/pear/bin:$PATH
#export PATH=/usr/local/bin:/opt/local/bin:/usr/local/sbin:$MYSQL_HOME/bin:~/bin:~/pear/bin:$PATH
export PATH="$HOME/.rbenv/bin:$GOPATH/bin:$PATH:$ANACONDA_HOME/bin"
#export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"
export BANCO=~/code/gh/firstbanco
export EDITOR=vim
#source ~/.aws_env
#source ~/.aws_cred
#source ~/.opscode_env

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
alias rg='g checkout Gemfile.lock db/schema.rb'
alias tc='truecrypt -t'
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

