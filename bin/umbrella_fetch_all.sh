#!/bin/zsh
# Either need to use keychain or have the ssh agent shared
# http://serverfault.com/questions/92683/execute-rsync-command-over-ssh-with-an-ssh-agent-via-crontab/92689#92689
# http://stackoverflow.com/questions/7994663/git-push-via-cron
echo $USER
echo "Git config before"
git config -l
. ~/.zshrc
echo "Got config after"
git config -l
cd $BANCO/banco-umbrella
rake git:fetch:all
