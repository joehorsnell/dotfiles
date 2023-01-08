My configuration files.

# Initial setup

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/joehorsnell/dotfiles/HEAD/init.sh)"

# Per-machine setup

rm ~/.zsh_history && ln -s ~/Dropbox/dev/.zsh_history ~/.zsh_history
ln -s ~/Dropbox/dev/.gitconfig ./.gitconfig
