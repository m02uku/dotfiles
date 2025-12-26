{ config, pkgs, ... }:

{
  # Core packages (platform-agnostic)
  home.packages = with pkgs; [
    git
    curl
    wget
    ripgrep
    fd
    jq
    eza
    ghq
    lazygit
    cowsay
    cmatrix
    toilet
    peco
    zoxide
    gh
    fzf
  ];

  # Import modular configurations
  imports = [
    ./modules/zsh.nix
    ./modules/neovim.nix
    ./modules/starship.nix
    ./modules/kitty.nix
  ];

  # Let Home Manager manage itself
  programs.home-manager.enable = true;
}

