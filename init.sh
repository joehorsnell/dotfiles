#!/usr/bin/env bash
set -euo pipefail

install_homebrew_if_required() {
  if command -v brew >/dev/null 2>&1; then
    echo "Homebrew already installed 👍"
  else
    echo "Installing Homebrew 🍺"
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

stow_packages() {
  declare -a packages=("asdf" "mackup" "psql" "ripgrep" "zsh")
  for package in "${packages[@]}"
  do
    echo "stowing package ${package}"
    stow --dir="${dir}" --target ~/ "${package}"
  done
}

clone_dotfiles_if_required() {
  [ ! -d ~/.dotfiles ] && git clone https://github.com/joehorsnell/dotfiles.git ~/.dotfiles
}

install_homebrew_if_required
install_required_packages
clone_dotfiles_if_required

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# fzf config
# Note: we know that the required config is already in zsh, so use --no-update-rc
[ ! -f ~/.fzf.zsh ] && $(brew --prefix)/opt/fzf/install --no-update-rc --key-bindings --completion

exit 0
