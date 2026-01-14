<div align="center">

# 🚀 Portable Nix Dev Environment

_A declarative, reproducible development environment using Nix and Home Manager._

[![Nix](https://img.shields.io/badge/Nix-5277C3?style=for-the-badge&logo=nix&logoColor=white)](https://nixos.org/)
[![License](https://img.shields.io/github/license/s0r4d3v/dotfiles?style=for-the-badge)](LICENSE)
[![Stars](https://img.shields.io/github/stars/s0r4d3v/dotfiles?style=for-the-badge)](https://github.com/s0r4d3v/dotfiles/stargazers)

</div>

---

## 📋 Table of Contents

-   Quick Start
-   Directory Structure
-   Using Devshells
-   SSH Configuration
-   Tmux (Terminal Multiplexer)
-   Contributing

---

## 🚀 Quick Start

### 🆕 On a New Machine

1. 📦 **Install Nix**

    ```bash
    curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install; exec $SHELL
    ```

2. 🔑 **Copy SSH key** (optional)

    ```bash
    scp ~/.ssh/id_ed25519* user@new-machine:~/.ssh/
    ```

3. 📥 **Clone & activate**

    ```bash
    git clone https://github.com/s0r4d3v/dotfiles.git
    cd dotfiles
    nix build ".#homeConfigurations.$(whoami).activationPackage"
    ./result/activate

    # Move to ghq-managed location (ghq is now available)
    rm -rf ../dotfiles
    ghq get https://github.com/s0r4d3v/dotfiles.git
    ```

4. ✅ **Verify**

    ```bash
    cat ~/.ssh/config; nd python
    ```

### 🔄 Updating

```bash
cd ~/ghq/github.com/s0r4d3v/dotfiles
git pull
nix build ".#homeConfigurations.$(whoami).activationPackage"
./result/activate
cd -
```

### Manual Activation (Alternative to ./activate.sh)

No longer needed - this is now the standard method.

### ⚠️ Troubleshooting

-   🚨 'builtins.toFile' warnings: Ignore.
-   🔐 SSH decryption failed: Check `~/.ssh/id_ed25519`.
-   🐚 Zsh glob errors: Run `setopt no_extended_glob`.

---

## 📁 Directory Structure

| Directory                     | Purpose                                                      |
| :---------------------------- | :----------------------------------------------------------- |
| `modules/devshells/`          | 🐍 Language support - See available devshells here           |
| `modules/home/base.nix`       | 🏠 Base home-manager configuration                           |
| `modules/home/browser/`       | 🌐 Web browser settings                                      |
| `modules/home/cli/`           | 💻 CLI tools and shell configuration                         |
| `modules/home/communication/` | 💬 Communication apps (Slack, Discord, etc.)                 |
| `modules/home/editor/`        | ✏️ Neovim LSP config - Language servers, linters, formatters |
| `modules/home/productivity/`  | 📅 Productivity tools (notes, calendar, etc.)                |
| `modules/home/terminal/`      | 🖥️ Terminal emulator settings                                |

**Want to add a new language?**

-   Devshell: Check `modules/devshells/` for examples
-   LSP config: Check `modules/home/editor/lsp.nix` (separate from devshells)

---

## Using Devshells

Enter language-specific development environments:

````bash
# From dotfiles directory
nix develop .#python

# From any project directory (after running ./activate.sh)
nd python

# Or explicitly
nix develop "$DOTFILES_PATH#python"

# Other languages: Check modules/devshells/ directory!

Available devshells:
- `python` - Python development environment
- `haskell` - Haskell development environment
- `markdown` - Markdown editing environment
- `quarto` - Quarto publishing environment
- `slidev` - Slidev presentation environment
- `typst` - Typst document environment

**Tip:** LSP features activate automatically when you open files in supported languages.

---

## Project Environments with Direnv

For project-specific environments that activate automatically:

```bash
# Copy template to your project
cp -r modules/templates/python-ml ~/your-project
cd ~/your-project

# Create .envrc file
echo "use flake" > .envrc

# Edit flake.nix for your needs
# Then activate
direnv allow

# Environment activates automatically when you cd into the project!
````

**Tip:** Templates include ready-to-use `flake.nix` files.

---

### SSH Configuration Management

SSH settings are managed manually. Store your SSH config at `~/.ssh/config` and private keys in `~/.ssh/`. No Nix-managed encryption or decryption.

## Tmux (Terminal Multiplexer)

Tmux provides panes, tabs, and windows for terminal management.

### Usage

-   **Start Tmux**: Use `tm`.
-   **Prefix Key**: `Ctrl-a` (like screen).
-   **Common Commands**:
-   `Ctrl-a c` - Create new window
-   `Ctrl-a |` - Vertical split
-   `Ctrl-a -` - Horizontal split
-   `Ctrl-a h/j/k/l` - Navigate panes
-   `Ctrl-a r` - Reload config

See [Tmux documentation](https://github.com/tmux/tmux/wiki) for details.
