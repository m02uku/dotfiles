# Slidev Development Environment

## Quick Start

```bash
# From dotfiles directory
nix develop .#slidev

# From any project directory (after running ./activate.sh)
nd slidev
```

## Available Tools

- **Node.js 22**: JavaScript runtime
- **pnpm**: Fast package manager

## Usage Examples

```bash
# Create a new Slidev project
pnpm create slidev

# Install dependencies
pnpm install

# Start development server
pnpm dev

# Build for production
pnpm build

# Export to PDF
pnpm export
```
