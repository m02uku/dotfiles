# Markdown Development Environment

## Quick Start

```bash
# From dotfiles directory
nix develop .#markdown

# From any project directory (after running ./activate.sh)
nd markdown
```

## Available Tools

This environment provides a clean shell for Markdown editing and processing.

## Usage Examples

```bash
# Edit with your preferred editor
# Tools like pandoc can be installed via nix-shell if needed

# Example with pandoc (if installed separately)
pandoc input.md -o output.html
```
