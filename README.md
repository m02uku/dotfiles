# Pure Nix Dotfiles

Hermetic, declarative development environment for macOS and Linux using Nix Flakes and Home Manager.

## Features

- **Pure & Reproducible**: Zero impurity, no host environment dependencies
- **Cross-Platform**: Works on x86_64-linux, x86_64-darwin, aarch64-darwin
- **Modular**: Clean separation of concerns with typed Nix configurations
- **Zero External Files**: All configs use Home Manager typed options

## Quick Start

### Prerequisites

Install Nix with flakes enabled:

```bash
# Install Nix (Determinate Systems installer - 2025 recommended method)
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# Or use official installer
curl -L https://nixos.org/nix/install | sh

# If using official installer, enable flakes manually:
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

### Fresh Installation

```bash
# Clone repository
git clone https://github.com/m02uku/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Edit flake.nix lines 22-23:
# - username = "your-username-here"
# - system = "your-system-here"  (x86_64-darwin, aarch64-darwin, or x86_64-linux)
vim flake.nix

# Remove existing Home Manager directory if present
rm -rf ~/Applications/Home\ Manager\ Apps  # macOS only

# Apply configuration
nix run home-manager -- switch --flake ~/dotfiles

# Verify installation
nvim --version
which zsh
```

**Note**: Configuration persists permanently across shell restarts and reboots. Changes only apply when you explicitly run `home-manager switch`.

## Daily Usage

### Update Configuration

```bash
cd ~/dotfiles

# 1. Edit any module (e.g., modules/neovim.nix)
vim modules/neovim.nix

# 2. Apply changes
home-manager switch --flake ~/dotfiles

# 3. Commit and push
git add .
git commit -m "Update neovim config"
git push
```

### Update Packages

```bash
cd ~/dotfiles

# Update flake.lock to latest nixpkgs
nix flake update

# Apply updates
home-manager switch --flake ~/dotfiles
```

### Sync to Another Machine

```bash
cd ~/dotfiles
git pull
home-manager switch --flake ~/dotfiles
```

## Aliases (Optional)

Add to `modules/zsh.nix`:

```nix
shellAliases = {
  hms = "home-manager switch --flake ~/dotfiles";
  hmu = "cd ~/dotfiles && nix flake update && home-manager switch --flake ~/dotfiles";
  ll = "ls -lah";
  ".." = "cd ..";
};
```

Then simply run `hms` to apply changes or `hmu` to update everything.

## Structure

```
.
├── flake.nix           # Entry point, system abstraction
├── flake.lock          # Locked dependency versions
├── home.nix            # Main user configuration
└── modules/
    ├── zsh.nix         # Shell configuration
    ├── neovim.nix      # Editor configuration
    ├── starship.nix    # Prompt configuration
    └── kitty.nix       # Terminal configuration
```

## Customization

### Add New Tools

Edit `home.nix`:

```nix
home.packages = with pkgs; [
  git
  ripgrep
  # Add your tools here
  bat
  eza
];
```

### Modify Existing Modules

All configurations are in `modules/*.nix`. Use Home Manager typed options only—no external config files.

Example - Add Neovim plugins:

```nix
# modules/neovim.nix
plugins = with pkgs.vimPlugins; [
  nvim-lspconfig
  # Add more plugins
  vim-commentary
  gitsigns-nvim
];
```

## Validation

```bash
# Check flake for errors
nix flake check

# Build without applying
nix build .#homeConfigurations.$(uname -m)-$(uname -s | tr '[:upper:]' '[:lower:]').activationPackage
```

## Rollback

```bash
# List generations
home-manager generations

# Rollback to previous generation
/nix/store/<previous-generation-path>/activate
```

## Uninstall

```bash
home-manager uninstall
```

## Troubleshooting

**Build fails after `git pull`**: Run `nix flake update` to refresh dependencies.

**Username mismatch**: Ensure `flake.nix` has your correct username (line 33).

**Permission errors**: Check that Nix daemon is running and you have correct permissions.

## Resources

- [Home Manager Manual](https://nix-community.github.io/home-manager/)
- [Nixpkgs Search](https://search.nixos.org/packages)
- [Nix Flakes Guide](https://nixos.wiki/wiki/Flakes)

## License

MIT
