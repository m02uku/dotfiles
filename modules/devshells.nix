# Dev shells are now organized in modules/devshells/
# This file imports all dev shell definitions

{ ... }:
{
  # Import all dev shell modules
  imports = [
    ./devshells/python.nix
    ./devshells/slidev.nix
    ./devshells/quarto.nix
    ./devshells/typst.nix
  ];
}
