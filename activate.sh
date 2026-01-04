#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

USER_NAME="$(whoami)"

# Update DOTFILES_PATH in base.nix
sed -i "" "s|/placeholder/dotfiles/path|$SCRIPT_DIR|g" modules/home/base.nix

echo "==> Building home-manager configuration for $USER_NAME..."
nix build ".#homeConfigurations.$USER_NAME.activationPackage" --no-link -o result

echo "==> Decrypting SSH config..."
if nix run nixpkgs#age -- --version >/dev/null 2>&1; then
  nix run nixpkgs#age -- -d -i ~/.ssh/id_ed25519 secrets/ssh/config.age > ~/.ssh/config.tmp
  mv ~/.ssh/config.tmp ~/.ssh/config
  chmod 600 ~/.ssh/config
  echo "SSH config decrypted successfully"
else
  echo "age not found, skipping SSH config decryption"
fi

echo "==> Activating..."
HOME_MANAGER_BACKUP_EXT=bak ./result/activate

echo "==> Done!"
