<div align="center">

# 🚀 Portable Nix Dev Environment

_A declarative, reproducible development environment using Nix and Home Manager._

[![Nix](https://img.shields.io/badge/Nix-5277C3?style=for-the-badge&logo=nix&logoColor=white)](https://nixos.org/)
[![License](https://img.shields.io/github/license/s0r4d3v/dotfiles?style=for-the-badge)](LICENSE)
[![Stars](https://img.shields.io/github/stars/s0r4d3v/dotfiles?style=for-the-badge)](https://github.com/s0r4d3v/dotfiles/stargazers)

</div>

---

## 📋 Table of Contents

-   Prerequisites
-   Installation (New Machine)
-   Updating
-   Module Management
-   Directory Structure
-   Using Devshells
-   SSH Configuration
-   Tmux (Terminal Multiplexer)
-   Contributing

---

## 📋 Prerequisites

Before getting started, ensure you have Nix installed on your system.

### Install Nix

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install; exec $SHELL
```

For other installation methods, see the [official Nix documentation](https://nixos.org/download).

---

## 🆕 Installation (New Machine)

1. **Clone the repository**

   ```bash
   git clone https://github.com/s0r4d3v/dotfiles.git
   cd dotfiles
   ```

2. **Build and activate the configuration**

   ```bash
   nix build ".#homeConfigurations.$(whoami).activationPackage"
   ./result/activate
   ```

3. **Optional: Move to ghq-managed location** (if using ghq)

   ```bash
   # Move to ghq-managed location (ghq is now available)
   rm -rf ../dotfiles
   ghq get https://github.com/s0r4d3v/dotfiles.git
   ```

4. **Verify installation**

   ```bash
   # Check if tools are available
   nd python  # Enter Python devshell
   tm         # Start Tmux
   v          # Open Neovim
   ```

---

## 🔄 Updating

To pull the latest changes from GitHub and apply them to your local setup:

```bash
cd ~/ghq/github.com/s0r4d3v/dotfiles
git pull
nix build ".#homeConfigurations.$(whoami).activationPackage"
./result/activate
```

This will:
- Pull the latest version from GitHub.
- Rebuild the configuration with any new changes.
- Apply the updates to your user environment.

---

## 🛠️ Module Management

### Adding or Updating Modules

Modules are automatically loaded via `import-tree`. To add a new module:

1. Create a new `.nix` file in the appropriate `modules/home/` subdirectory (e.g., `modules/home/cli/my-tool.nix`).
2. Define it as `flake.modules.homeManager.<name> = { ... }: { ... };`.
3. Rebuild and activate: `nix build ".#homeConfigurations.$(whoami).activationPackage" && ./result/activate`.

### Customizing Existing Modules

Edit the relevant files in `modules/home/` (e.g., `editor/lsp.nix` for LSP settings), then rebuild and activate as above.

For detailed module structure, see the Directory Structure section below.

### ⚠️ Troubleshooting

-   🚨 'builtins.toFile' warnings: Ignore.
-   🔐 SSH decryption failed: Check `~/.ssh/id_ed25519`.
-   🐚 Zsh glob errors: Run `setopt no_extended_glob`.
-   📦 Build fails: Ensure Nix is installed and run `nix flake update` to refresh inputs.

---

## 📁 Directory Structure

| Directory                     | Purpose                                                      |
| :---------------------------- | :----------------------------------------------------------- |
| `modules/devshells/`          | 🐍 Language-specific development environments                |
| `modules/home/base.nix`       | 🏠 Base home-manager configuration                           |
| `modules/home/browser/`       | 🌐 Web browser settings                                      |
| `modules/home/cli/`           | 💻 CLI tools, Git config, and shell settings                 |
| `modules/home/editor/`        | ✏️ Neovim configuration (base, LSP, plugins, keymaps)        |
| `modules/home/productivity.nix`| 📅 Productivity and communication tools                      |
| `modules/home/terminal/`      | 🖥️ Terminal multiplexer and prompt settings                  |

**Want to add a new language?**

-   Devshell: Check `modules/devshells/` for examples
-   LSP config: Check `modules/home/editor/lsp.nix` (separate from devshells)
-   CLI tools: Add to `modules/home/cli/programs.nix`

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
