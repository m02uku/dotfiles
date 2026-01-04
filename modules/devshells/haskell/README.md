# Haskell Development Environment

## Quick Start

```bash
# From dotfiles directory
nix develop .#haskell

# From any project directory (after running ./activate.sh)
nd haskell

# Or explicitly
nix develop "$DOTFILES_PATH#haskell"
```

## Available Tools

-   **Cabal**: Haskell package manager and build system

## Usage Examples

```bash
# Initialize a new project
cabal init

# Build the project
cabal build

# Run tests
cabal test

# Start REPL
ghci

# Install packages
cabal install package-name
```
