<div align="center">

# 🖥️ Hack Your Setup Like a Boss 🕵️‍♂️

_This ain't your grandma's config. Nix + Home Manager = Reproducible Dev Chaos That Actually Works._  
*(Because who wants to manually tweak configs on every machine? This bad boy deploys your dev fortress with one command. Boom! 💥)*

[![Nix](https://img.shields.io/badge/Nix-5277C3?style=for-the-badge&logo=nix&logoColor=white)](https://nixos.org/)
[![License](https://img.shields.io/github/license/s0r4d3v/dotfiles?style=for-the-badge)](LICENSE)
[![Stars](https://img.shields.io/github/stars/s0r4d3v/dotfiles?style=for-the-badge)](https://github.com/s0r4d3v/dotfiles/stargazers)

</div>

---

## 🚀 Quick Setup (No Bullshit)

- [Prerequisites](#-prerequisites)
- [Install on New Machine](#-installation-new-machine)
- [Update Your Hack](#-updating)
- [Customize & Pwn](#-module-management)
- [Devshells & Tools](#using-devshells)
- [Troubleshoot Like a Pro](#-troubleshooting)

---

## 🔑 Prerequisites

**Install Nix** (or your setup's DOA).  
One-liner:  
```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install; exec $SHELL
```  
*(Other ways? [Nix docs](https://nixos.org/download) – but this one's the hacker's choice.)*

---

## 🆕 Installation (New Machine)

**Clone & Deploy (3 Steps to Glory):**  
```bash
git clone https://github.com/s0r4d3v/dotfiles.git && cd dotfiles
nix build ".#homeConfigurations.$(whoami).activationPackage" && ./result/activate
# Optional: ghq get https://github.com/s0r4d3v/dotfiles.git  # For the organized hacker
```  
**Test Your Hack:** `nd python`, `tm`, `v` – If it works, you're a wizard. 🧙‍♂️

---

## 🔄 Updating

**Stay Fresh (No Stale Configs Allowed):**  
```bash
cd ~/ghq/github.com/s0r4d3v/dotfiles && git pull
nix build ".#homeConfigurations.$(whoami).activationPackage" && ./result/activate
```  
*(Pulls updates, rebuilds, deploys. Like updating your memes – keep 'em current!)*

---

## 🛠️ Module Management

**Add/Modify Modules (Hack Your Config):**  
- New module? Drop `.nix` in `modules/home/` (e.g., `cli/my-tool.nix`), define in flake.  
- Edit existing: Tweak files in `modules/home/`, rebuild: `nix build ".#homeConfigurations.$(whoami).activationPackage" && ./result/activate`.  

**Troubleshoot Like a Boss:**  
- Warnings? Ignore 'em (they're just complaining).  
- SSH fail? Check `~/.ssh/id_ed25519`.  
- Zsh errors? `setopt no_extended_glob`.  
- Build bust? `nix flake update`.  
*(Because even hackers hit walls – but we debug 'em.)*

---

## 📁 Directory Structure

| Dir | What It Does |
|----|--------------|
| `modules/devshells/` | 🐍 Dev envs for langs |
| `modules/home/` | All your configs (editor, cli, browser, etc.) |

*(Add langs? Copy devshell examples, tweak LSP in editor/, add tools to cli/.)*

---

## 💻 Devshells & Tools

**Enter Dev Mode:**  
`nix develop .#python` or `nd python` (after activate).  
*(Available: python, haskell, quarto, slidev, typst. LSP auto-activates – magic! ✨)*

---

## 🏗️ Project Envs (Direnv Style)

**Auto-Activate Per Project:**  
```bash
cp -r modules/templates/python-ml ~/project && cd ~/project
echo "use flake" > .envrc && direnv allow
```  
*(Edit flake.nix, cd in – boom, env loads. Templates ready to fork!)*

---

## 🔐 SSH & 🖥️ Tmux

**SSH:** Manual setup at `~/.ssh/`. (No Nix crypto – keep your keys safe, hacker!)  

**Tmux:** `tm` to start. Prefix: `Ctrl-a`.  
- `c` new window, `|`/`-` split, `h/j/k/l` nav, `r` reload.  
*(Multitask like a boss. [Docs](https://github.com/tmux/tmux/wiki) for more.)*

---

## 🤝 Contributing

Fork, hack, PR. Ideas? [Issues](https://github.com/s0r4d3v/dotfiles/issues).  
*(Let's build the ultimate dev fortress together! 🏰)*
