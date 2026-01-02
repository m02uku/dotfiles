#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

USER_NAME="$(whoami)"
HOME_DIR="$HOME"

# Generate local config if not exists
LOCAL_NIX="$SCRIPT_DIR/local.nix"
if [[ ! -f "$LOCAL_NIX" ]]; then
  echo "==> Generating local.nix for $USER_NAME"
  cat > "$LOCAL_NIX" << EOF
{
  user = "$USER_NAME";
  homeDir = "$HOME_DIR";
}
EOF
fi

echo "==> Building home-manager configuration..."
nix build ".#homeConfigurations.$USER_NAME.activationPackage" --no-link -o result

echo "==> Activating..."
HOME_MANAGER_BACKUP_EXT=bak ./result/activate

echo "==> Done!"
