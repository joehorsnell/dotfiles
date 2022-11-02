#!/usr/bin/env bash
set -euo pipefail

install_homebrew_if_required() {
  if command -v brew >/dev/null 2>&1; then
    echo "Homebrew already installed 👍"
  else
    echo "Installing Homebrew 🍺"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi
}

install_required_packages() {
  # TODO - move this to a Brewfile
  declare -a packages=("fzf" "stow")
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

install_homebrew_if_required
install_required_packages

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# stow packages
declare -a packages=("asdf" "mackup" "psql" "ripgrep" "zsh")
for package in "${packages[@]}"
do
   echo "stowing package ${package}"
   stow --dir="${dir}" --target ~/ "${package}"
done

# fzf config
# Note: we know that the required config is already in zsh, so use --no-update-rc
[ ! -f ~/.fzf.zsh ] && $(brew --prefix)/opt/fzf/install --no-update-rc --key-bindings --completion

exit 0
