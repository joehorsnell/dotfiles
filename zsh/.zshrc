# zmodload zsh/zprof

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes or in ~/.oh-my-zsh/themes/
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git gem jq bundler rake brew macos vagrant gpg-agent pass zsh-autosuggestions)

source_file_if_exists () {
  [[ -f "$1" ]] && source "$1"
}

mkcd () {
  mkdir -p -- "$1" && cd -P -- "$1"
}

source_file_if_exists $ZSH/oh-my-zsh.sh

for conf in "$HOME/.dotfiles/zsh/config/"*.zsh; do
  source "${conf}"
done
unset conf

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export SUBL_EDITOR='subl --new-window --wait'
export VSCODE_EDITOR='code --new-window --wait'
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
  export GIT_EDITOR='vim'
else
  export EDITOR=$VSCODE_EDITOR
  export GIT_EDITOR=$VSCODE_EDITOR
fi

# History
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/Dropbox/dev/backup/.zsh_history.$(scutil --get LocalHostName).local

# Customize to your needs...
export GOPATH=$HOME/code/go
export PATH=/usr/local/bin:/bin:/usr/bin:/usr/local/share/python:/opt/local/bin:/usr/local/sbin:$MYSQL_HOME/bin:~/bin:~/pear/bin:$PATH
#export PATH=/usr/local/bin:/opt/local/bin:/usr/local/sbin:$MYSQL_HOME/bin:~/bin:~/pear/bin:$PATH
#export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"
export PASSWORD_STORE_DIR=.
export RIPGREP_CONFIG_PATH=~/.ripgreprc
# GIT_OPTIONAL_LOCKS=0 fixes https://github.com/kemayo/sublime-text-git/issues/467
export GIT_OPTIONAL_LOCKS=0

if [[ -f "$1" ]]; then
  export HOMEBREW_GITHUB_API_TOKEN=$(cat ~/.homebrew-github-access-token)
fi

# timeout is in ms (10_000_000)
export PGOPTIONS="-c statement_timeout=10000000"
# The long form of -FXR
export LESS='--quit-if-one-screen --no-init --RAW-CONTROL-CHARS'

mkdir -p ~/.ssh/sockets

zmodload zsh/complist
autoload -U compinit
compinit -u
autoload -U colors
colors
zstyle ':completion:*' show-ambiguity "1;$color[fg-red]"
# Enable Ctrl-x-e to edit command line
# - https://nuclearsquid.com/writings/edit-long-commands/
# - https://unix.stackexchange.com/questions/6620/how-to-edit-command-line-in-full-screen-editor-in-zsh
autoload -U edit-command-line

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Config for Homebrew on Apple Silicon
[ -f /opt/homebrew/bin/brew ] && eval $(/opt/homebrew/bin/brew shellenv)

if command -v mise 1>/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

if command -v atuin 1>/dev/null 2>&1; then
  # https://atuin.sh/docs/key-binding
  eval "$(atuin init zsh --disable-up-arrow)"
fi

if command -v starship 1>/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

if command -v telepresence 1>/dev/null 2>&1; then
  eval "$(telepresence completion zsh)"
fi

if command -v kubectl 1>/dev/null 2>&1; then
  eval "$(kubectl completion zsh)"
fi

[ -d "/opt/homebrew/opt/curl/bin" ] && export PATH="/opt/homebrew/opt/curl/bin:$PATH"
[ -d "/opt/homebrew/opt/postgresql@16/bin" ] && export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-parameters-prompting.html
export AWS_CLI_AUTO_PROMPT=on-partial
# https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-completion.html
if command -v aws_completer 1>/dev/null 2>&1; then
  complete -C 'aws_completer' aws
fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.rd/bin:$PATH" # Rancher Desktop

#OktaAWSCLI
if [[ -f "$HOME/.okta/bash_functions" ]]; then
    . "$HOME/.okta/bash_functions"
fi
if [[ -d "$HOME/.okta/bin" && ":$PATH:" != *":$HOME/.okta/bin:"* ]]; then
    PATH="$HOME/.okta/bin:$PATH"
fi

# GITHUB_ACTOR and GITHUB_TOKEN
# export GITHUB_TOKEN="op://Private/sadxcbiknzgcvcsuqkbgh7mwyq/Personal"
export GITHUB_ACTOR="op://Private/sadxcbiknzgcvcsuqkbgh7mwyq/Username"
export GITHUB_TOKEN="op://Private/sadxcbiknzgcvcsuqkbgh7mwyq/Bitso PAT 2024"

# Rancher Desktop/Testcontainers
# export DOCKER_HOST=unix://$HOME/.rd/docker.sock
# export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock
# export TESTCONTAINERS_HOST_OVERRIDE=$(rdctl shell ip a show vznat | awk '/inet / {sub("/.*",""); print $2}')

# Bitso stuff to remove
# export AWS_CA_BUNDLE=~/Dropbox/Bitso/ZscalerRootCertificate-2048-SHA256.crt
# export NODE_EXTRA_CA_CERTS=~/Dropbox/Bitso/ZscalerRootCertificate-2048-SHA256.crt

# zprof
