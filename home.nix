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
    zoxide
    gh
    fzf
    bat
    bat           # cat 代替
    delta         # git diff
    btop          # システムモニター
    dust          # du 代替
    duf           # df 代替
    tealdeer      # tldr
    procs         # ps 代替
    tokei         # コード行数
    hyperfine     # ベンチマーク
    sd            # sed 代替
    zellij        # tmux 代替
  ];

  # Import modular configurations
  imports = [
    ./modules/zsh.nix
    ./modules/neovim.nix
    ./modules/starship.nix
    ./modules/kitty.nix
    ./modules/git.nix
  ];

  # Let Home Manager manage itself
  programs.home-manager.enable = true;
}

