#!/usr/bin/env bash
set -euo pipefail

install_homebrew() {
  [ -f /opt/homebrew/bin/brew ] && eval $(/opt/homebrew/bin/brew shellenv)

  if command -v brew >/dev/null 2>&1; then
    echo "Homebrew already installed 👍"
  else
    echo "Installing Homebrew 🍺"
    # Install stanza from https://brew.sh
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    [ -f /opt/homebrew/bin/brew ] && eval $(/opt/homebrew/bin/brew shellenv)
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
  if [ ! -f ~/.fzf.zsh ]; then
    echo "Installing fzf config"
    # Note: we know that the required config is already in zsh, so use --no-update-rc
    "$(brew --prefix)/opt/fzf/install" --no-update-rc --key-bindings --completion
  else
    echo "fzf config already installed 👍"
  fi
}

install_ohmyzsh() {
  if [ ! -d ~/.oh-my-zsh ]; then
    echo "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)" "" --skip-chsh --unattended --keep-zshrc
    if [[ ! -L ~/.zshrc ]]; then
      echo "Deleting default .zshrc config added by oh-my-zsh installer"
      rm ~/.zshrc
    fi
  else
    echo "oh-my-zsh already installed 👍"
  fi
}

clone_jq_zsh_plugin_repo() {
  if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/jq ]; then
    echo "Cloning jq-zsh-plugin repo"
    git clone https://github.com/reegnz/jq-zsh-plugin.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/jq
  else
    echo "jq-zsh-plugin repo already cloned 👍"
  fi
}

clone_zsh_autosuggestions_repo() {
  if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]; then
    echo "Cloning zsh-autosuggestions repo"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  else
    echo "zsh-autosuggestions repo already cloned 👍"
  fi
}

clone_dotfiles() {
  if [ ! -d ~/.dotfiles ]; then
    echo "Cloning dotfiles"
    git clone https://github.com/joehorsnell/dotfiles.git ~/.dotfiles
  else
    echo "dotfiles already cloned 👍"
  fi
}

stow_packages() {
  declare -a packages=("asdf" "atuin" "bash" "bat" "fish" "git" "Homebrew" "mackup" "psql" "ripgrep" "rubocop" "zsh")
  for package in "${packages[@]}"
  do
    echo "stowing package ${package}"
    stow --target ~/ "${package}"
  done
}

install_homebrew
install_required_packages
install_fzf_config
install_ohmyzsh
clone_jq_zsh_plugin_repo
clone_zsh_autosuggestions_repo
clone_dotfiles

(cd ~/.dotfiles && stow_packages)

exit 0
