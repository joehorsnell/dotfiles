export BANCO=~/code/gh/bambooengineering
export PROD_DEPLOYS=~/Dropbox\ \(Bamboo\ Limited\)/Department\ Development/Production\ Deploys/
source_file_if_exists ~/.vostron.env

alias fb='cd $BANCO'
alias rgfa='rake git:fetch:all'
alias rgma='rake git:merge:all'
alias rgla='rake git:pull:all'
alias rgpa='rake git:push:all'
alias um='cd $BANCO/umbrella'
alias um2='cd $BANCO/umbrella2'
alias um3='cd $BANCO/umbrella3'

source_file_if_exists "$HOME/.config/bamboo/bamboo_rc"
