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
#DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true"

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
#export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"
export BANCO=~/code/gh/firstbanco
export EDITOR=vim
export PASSWORD_STORE_DIR=.
export HOMEBREW_GITHUB_API_TOKEN=$(cat ~/.homebrew-github-access-token)

# timeout is in ms (10_000_000)
export PGOPTIONS="-c statement_timeout=10000000"
export PROD_DEPLOYS=~/Dropbox\ \(First\ Banco\ Limited\)/Dept\ Development/Production\ Deploys/

source ~/.vostron.env
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
alias rg='g checkout Gemfile.lock db/schema.rb'
alias tc='truecrypt -t'
alias igrep='grep -i'
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
