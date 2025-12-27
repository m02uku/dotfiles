{ config, pkgs, ... }:

{
  # Core packages (platform-agnostic)
  home.packages = with pkgs; [
    # === Core Utilities ===
    git
    curl
    wget
    ripgrep
    fd
    fzf
    jq

    # === Modern CLI Tools ===
    eza
    bat
    delta
    btop
    dust
    duf
    procs
    zoxide
    tealdeer
    hyperfine
    tokei

    # === Development ===
    gh
    lazygit
    ghq

    # === Terminal ===
    zellij

    # === Container ===
    docker
    docker-compose

    # === Optional:  削除推奨 ===
    cowsay
    cmatrix
    toilet

    # === クラウド CLI ===
    awscli2
    google-cloud-sdk
    azure-cli
  ];

  # Import modular configurations
  imports = [
    ./modules/zsh.nix
    ./modules/nixvim.nix
    ./modules/starship.nix
    ./modules/kitty.nix
    ./modules/git.nix
    ./modules/python.nix
  ];

  # === ✅ これを追加 ===
  targets.darwin.copyApps = {
    enable = false; # copyApps を無効化
  };

  # Let Home Manager manage itself
  programs.home-manager.enable = true;
}

