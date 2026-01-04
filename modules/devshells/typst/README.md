# Typst Development Environment

## Quick Start

```bash
# From dotfiles directory
nix develop .#typst

# From any project directory (after running ./activate.sh)
nd typst

# Or explicitly
nix develop "$DOTFILES_PATH#typst"
```

## Available Tools

-   **Typst**: Markup-based typesetting system

## Usage Examples

```bash
# Compile document
typst compile document.typ

# Watch for changes
typst watch document.typ

# Create PDF
typst compile document.typ output.pdf

# Query document metadata
typst query document.typ "<label>"
```
