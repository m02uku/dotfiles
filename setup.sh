#!/bin/bash

# Install packages
sudo apt update && sudo apt install -y \
  curl \
  git \
  figlet \
  cmatrix \
  neofetch \

# Install Starship prompt
curl -sS https://starship.rs/install.sh | sh -s -- -y

# TODO: add here

# Helpers: log directory creation, deletions, and symlink creation
ensure_dir() {
  local d="$1"
  if mkdir -p "$d"; then
    echo "ensured directory $d"
  else
    echo "failed to ensure directory $d" >&2
  fi
}

link_file() {
  local src="$1" dst="$2"
  if [ -e "$dst" ] || [ -L "$dst" ]; then
    if rm -rf "$dst"; then
      echo "deleted $dst"
    else
      echo "failed to delete $dst" >&2
    fi
  fi
  if ln -s "$src" "$dst"; then
    echo "created symlink $dst -> $src"
  else
    echo "failed to create symlink $dst -> $src" >&2
  fi
}

# Symlink config files from src to their destinations（既存は置き換え）
ensure_dir "$HOME/.config"
link_file "$PWD/src/starship.toml" "$HOME/.config/starship.toml"

# Link all files under src/.config/** -> ~/.config/**
if [ -d "$PWD/src/.config" ]; then
  find "$PWD/src/.config" -type f | while read -r f; do
    rel=${f#"$PWD/src/.config/"}
    ensure_dir "$HOME/.config/$(dirname "$rel")"
    link_file "$f" "$HOME/.config/$rel"
  done
fi

# Link files directly under src -> ~/<same name>
find "$PWD/src" -maxdepth 1 -type f | while read -r f; do
  base=$(basename "$f")
  link_file "$f" "$HOME/$base"
done

source "$HOME/.bashrc"
