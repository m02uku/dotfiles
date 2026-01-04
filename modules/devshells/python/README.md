# Python Development Environment

## Quick Start

```bash
# From dotfiles directory
nix develop .#python

# From any project directory (after running ./activate.sh)
nd python

# Or explicitly
nix develop "$DOTFILES_PATH#python"
```

## Available Tools

-   **Jupyter**: Interactive notebooks
-   **uv**: Fast Python package installer
-   **Marimo**: Reactive notebooks (installed via uv)

## Usage Examples

```bash
# Install additional packages
uv pip install numpy pandas

# Start Jupyter notebook
jupyter notebook

# Run Marimo
marimo edit

# Activate virtual environment (auto-activated on shell entry)
source venv/bin/activate
```
