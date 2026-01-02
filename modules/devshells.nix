# Dev shells are now organized in modules/devshells/
# Import-tree automatically imports all .nix files in subdirectories
# No explicit imports needed - import-tree handles this!

{ ... }:
{
  # All devshells in modules/devshells/ are automatically imported by import-tree
  # No manual imports required!
}
