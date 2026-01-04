# Haskell Development Environment

## Quick Start

```bash
# From dotfiles directory
nix develop .#hask

# From any project directory (after running ./activate.sh)
nd hask
```

## Available Tools

- **GHC**: Glasgow Haskell Compiler
- **Haskell Language Server**: LSP for IDE support
- **HLint**: Haskell linter
- **Ormolu**: Haskell code formatter
- **Cabal**: Haskell build tool

## Usage Examples

```bash
# Create a new project
cabal init

# Build project
cabal build

# Run tests
cabal test

# Format code
ormolu --mode inplace $(find . -name "*.hs")

# Lint code
hlint .



```
