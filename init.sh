#!/usr/bin/env bash
set -euo pipefail

install_homebrew() {
  if command -v brew >/dev/null 2>&1; then
    echo "Homebrew already installed 👍"
  else
    echo "Installing Homebrew 🍺"
    # Install stanza from https://brew.sh
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
}

install_required_packages() {
  # TODO - move this to a Brewfile
  declare -a packages=("curl" "fzf" "git" "stow")
  for package in "${packages[@]}"
  do
    if command -v "${package}" >/dev/null 2>&1; then
      echo "${package} already installed 👍"
    else
      echo "Installing ${package}"
      brew install "${package}"
    fi
  done
}

install_fzf_config() {
  # Note: we know that the required config is already in zsh, so use --no-update-rc
  [ ! -f ~/.fzf.zsh ] && $(brew --prefix)/opt/fzf/install --no-update-rc --key-bindings --completion
}

clone_dotfiles() {
  [ ! -d ~/.dotfiles ] && git clone https://github.com/joehorsnell/dotfiles.git ~/.dotfiles
}

stow_packages() {
  declare -a packages=("asdf" "mackup" "psql" "ripgrep" "zsh")
  for package in "${packages[@]}"
  do
    echo "stowing package ${package}"
    stow --dir="${dir}" --target ~/ "${package}"
  done
}

install_homebrew
install_required_packages
install_fzf_config
clone_dotfiles

# dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# (cd ~/.dotfiles && stow_packages)

exit 0
