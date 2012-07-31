# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="robharrop"

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
plugins=(git rbenv rake ruby bundler rails3 brew macports osx vagrant)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export MYSQL_HOME=/usr/local/mysql
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
export PATH=/opt/local/bin:/usr/local/sbin:$MYSQL_HOME/bin:~/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"
export BANCO=~/Work/github/firstbanco
source ~/.aws_env
source ~/.opscode_env

alias h=history
alias lt='ll -tr'
alias netstat_osx="sudo lsof -i -P"
alias fb='cd $BANCO'
alias um='cd $BANCO/banco-umbrella'
alias gr='cd `git rev-parse --show-toplevel`'
alias gsu='git submodule update'
alias rgla='rake git:pull:all'
alias rgpa='rake git:push:all'
alias st='nocorrect stree'
eval "$(rbenv init -)"
