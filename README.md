<div align="center">

# 🌲 Portable Nix Dev Environment

**One command. Any machine. Same setup.**

[![Nix](https://img.shields.io/badge/Nix-5277C3?style=for-the-badge&logo=nixos&logoColor=white)](https://nixos.org)
[![Neovim](https://img.shields.io/badge/Neovim-57A143?style=for-the-badge&logo=neovim&logoColor=white)](https://neovim.io)
[![macOS](https://img.shields.io/badge/macOS-000000?style=for-the-badge&logo=apple&logoColor=white)](https://apple.com)
[![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)](https://linux.org)

</div>

---

## ⚡ 30-Second Setup

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
git clone <your-repo> ~/nix_env && cd ~/nix_env && ./activate.sh
```

**That's it.** Your entire dev environment is ready. ✨

---

## 🎯 Why This?

<table>
<tr>
<td width="50%">

### 😫 Without Nix
```
brew install ...
apt install ...
pip install ...
"works on my machine" 🤷
```

</td>
<td width="50%">

### 😎 With This Setup
```bash
./activate.sh
# Done. Same on Mac, Linux, anywhere.
```

</td>
</tr>
</table>

---

## ✨ Features

| | Feature | What it means |
|:--:|:--|:--|
| 🔄 | **Portable** | Mac (Intel/M1) + Ubuntu |
| 🌳 | **Dendritic** | Auto-import via `import-tree` |
| 🧩 | **Modular** | 1 file = 1 feature |
| ✅ | **Pure** | No `--impure` needed |
| 📦 | **Project Envs** | direnv auto-activates |

---

## 📁 Structure

```
📦 nix_env
├── 🔧 flake.nix          # Entry point
├── 🚀 activate.sh        # One-command setup
│
├── 📂 modules/
│   ├── core/
│   │   ├── systems.nix   # x86/ARM × Mac/Linux
│   │   ├── home.nix      # Assembler
│   │   └── devshells.nix # Global dev envs
│   │
│   └── 📂 home/
│       ├── base.nix
│       │
│       ├── 📂 browser/       # 🌐 Browser
│       │   ├── firefox.nix   #    Enable & profile
│       │   ├── extensions.nix#    uBlock Origin, Vimium C
│       │   ├── search.nix    #    Search engines
│       │   ├── bookmarks.nix #    Declarative bookmarks
│       │   └── privacy.nix   #    Privacy hardening
│       │
│       ├── 📂 cli/           # 🔧 Command Line
│       │   ├── git.nix       #    git, gh, ghq, lazygit
│       │   ├── search.nix    #    ripgrep, fd, fzf
│       │   ├── shell.nix     #    zsh, zoxide, starship
│       │   ├── utils.nix     #    eza, bat, btop, dust...
│       │   └── nix-tools.nix #    comma, nix-index
│       │
│       └── 📂 editor/        # ✏️ Neovim (NixVim)
│           ├── neovim.nix    #    Core settings
│           ├── keymaps.nix   #    All keybindings
│           ├── lsp.nix       #    LSP, completion, lint
│           ├── ui.nix        #    Theme, statusline
│           ├── git.nix       #    Gitsigns
│           └── editing.nix   #    Treesitter, mini, etc.
│
└── 📂 templates/
    └── python-ml/        # Project templates
```

---

## 🛠️ Included Tools

### 🌐 Browser

| | Firefox with Privacy |
|:--|:--|
| 🛡️ **Extensions** | uBlock Origin, Vimium C |
| 🔒 **Privacy** | Telemetry off, Tracking Protection, Fingerprint Resistance |
| 🔍 **Search** | Google + custom (`@np` Nix Packages, `@gh` GitHub) |
| 📑 **Bookmarks** | Declarative management |

### 💻 CLI

| Category | Tools |
|:--|:--|
| 🔀 **Git** | `git` `gh` `ghq` `lazygit` `delta` |
| 🔍 **Search** | `ripgrep` `fd` `fzf` `zoxide` |
| 📊 **System** | `btop` `dust` `duf` |
| 🛠️ **Utils** | `eza` `bat` `jq` `xh` `tldr` `trash-cli` `entr` |
| ❄️ **Nix** | `comma` `nix-index` |
| 🐚 **Shell** | `zsh` `starship` |

### ✏️ Neovim

> **Modern 2026 Setup** — blink.cmp, snacks.nvim, mini.nvim

<table>
<tr><td>

| Layer | Plugins |
|:--|:--|
| 🧠 **LSP** | pyright, nil_ls, marksman |
| ⚡ **Completion** | **blink.cmp** (Rust-powered) |
| 🔧 **Lint** | ruff, statix, markdownlint |
| 🎨 **Format** | ruff, nixfmt, prettier |

</td><td>

| Layer | Plugins |
|:--|:--|
| 🎯 **Navigation** | snacks.picker, flash.nvim |
| 📁 **Files** | oil.nvim |
| 🎨 **Theme** | tokyonight |
| ✨ **UI** | lualine, snacks, mini.nvim |

</td></tr>
</table>

#### ⌨️ Key Bindings

| Key | Action |
|:--|:--|
| `Space` | Leader |
| `gd` / `gr` | Go to definition / references |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>gg` | Lazygit |
| `s` / `S` | Flash jump |
| `-` | Oil file manager |

---

## 🐚 Global Dev Shells

> **No project setup needed — instant environments**

```bash
nix develop .#python    # 🐍 Python 3.13 + ruff
nix develop .#slidev    # 🎨 Node.js + pnpm
nix develop .#quarto    # 📖 Quarto + Jupyter
nix develop .#typst     # 📝 Typst + tinymist
```

---

## 🔧 Per-Project Environments

<table>
<tr>
<td width="60%">

### 1️⃣ Create `flake.nix`

```nix
{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  outputs = { nixpkgs, ... }:
  let
    systems = [ "x86_64-darwin" "aarch64-darwin" "x86_64-linux" ];
    forAllSystems = f: nixpkgs.lib.genAttrs systems 
      (s: f nixpkgs.legacyPackages.${s});
  in {
    devShells = forAllSystems (pkgs: {
      default = pkgs.mkShell {
        packages = with pkgs; [ python313 nodejs ];
      };
    });
  };
}
```

</td>
<td width="40%">

### 2️⃣ Create `.envrc`

```bash
use flake
```

### 3️⃣ Activate

```bash
direnv allow
# Auto-loads on cd! 🎉
```

</td>
</tr>
</table>

---

## ➕ Adding New Features

> **Just add a file. That's it.**

```bash
# Example: Add tmux
cat > modules/home/terminal/tmux.nix << 'EOF'
{ ... }:
{
  flake.modules.homeManager.tmux = {
    programs.tmux.enable = true;
  };
}
EOF

./activate.sh  # Done!
```

---

## 🛠️ Common Commands

| Task | Command |
|:--|:--|
| 🔄 Apply changes | `./activate.sh` |
| 📦 Update packages | `nix flake update && ./activate.sh` |
| 🆕 New machine | `git clone ... && ./activate.sh` |
| 👤 Add new user | Edit `modules/core/home.nix` user list |

---

## 🖥️ Supported Systems

<div align="center">

| | System | Status |
|:--:|:--|:--:|
| 🍎 | macOS Intel | ✅ |
| 🍎 | macOS Apple Silicon | ✅ |
| 🐧 | Ubuntu/Linux x86 | ✅ |
| 🐧 | Ubuntu/Linux ARM | ✅ |

</div>


