{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    history = {
      size = 10000;
      path = "${config.home.homeDirectory}/.zsh_history";
    };
    
    shellAliases = {
      hms = "home-manager switch --flake ~/dotfiles";
      hmu = "cd ~/dotfiles && nix flake update && home-manager switch --flake ~/dotfiles";
      ll = "ls -lah";
      ".." = "cd ..";
    };
    
    initContent = ''
      # Minimal shell initialization
      setopt autocd
      setopt hist_ignore_dups
      setopt share_history
    '';
  };
}

