[[ -r ~/.bashrc ]] && . ~/.bashrc

if command -v mise 1>/dev/null 2>&1; then
  eval "$(mise activate bash --shims)"
fi
